import db from "../models/index";
import bcrypt from 'bcryptjs';
// import { Server } from "socket.io";
// let io = new Server({port:8080});
// let io = new Server(8080);
let salt = bcrypt.genSaltSync(10);
let checkUserEmail = (email)=>{
    return new Promise(async (resolve, reject)=>{
        try {
            let user = await db.Members.findOne({
                where: {email: email}
            })
            if (user) {
                resolve(true)
            }else{
                resolve(false)
            }
        } catch (error) {
            reject(error);
        }
    })
}
let hashUserPassword = (password)=>{
    return new Promise(async(resolve, reject)=>{
       try {
        let hashPassword =  bcrypt.hashSync(password.toString(), salt);
        
        resolve(hashPassword);

       } catch (error) {
            reject(error);
       }
        
        
    })
}
let ProfileMembersService = (id)=>{
    
    return new Promise(async(resolve, reject)=>{
        
       try {
            if(id){
                
                let userMember = await  db.Members.findOne({
                    where:{id:id}
                })
                    resolve({
                            errCode: 0,
                            errMessage: "Ok", 
                            userMember
                        })
            }else{
                resolve({
                    errCode: 1,
                    errMessage: "User không tồn tại", 
                })
            }

       } catch (error) {
            reject(error);
       }
        
        
    })

}
let EditProfileMembersService = (data)=>{
    
    return new Promise(async(resolve, reject)=>{
        console.log(data);
       try {
            if(!data.id){
                resolve({
                    errCode: 2,
                    errMessage:"Member không tồn tại"
                })
            }
            let member = await  db.Members.findOne({
                where: {id: data.id},
                raw: false

            
            });
            if(member){
                member.tenThanhVien= data.tenThanhVien,
                member.anhDaiDien= data.anhDaiDien,
                member.soDienThoai= data.soDienThoai,
                member.diaChi= data.diaChi,
                member.gioiTinh= data.gioiTinh,
            
                await member.save()
            
                    resolve({
                        errCode: 0,
                        errMessage:"Sửa thành công"
                    })
            
            }else{
                resolve({
                    errCode: 1,
                    errMessage:"User không tồn tại"
                })
            }

       } catch (error) {
            reject(error);
       }
        
        
    })

}
let AddMembersService = (data)=>{
    return new Promise(async(resolve, reject)=>{
        try {
            let check = await checkUserEmail(data.email)
            if(check === true) {
                resolve({
                    errCode: 1,
                    errMessage: "Email đã tồn tại, vui lòng chọn email khác",
                    data:{}
                    
                })
            }else{
            
            let hashPasswordFromBcrypt =  await hashUserPassword(data.matKhau);
                console.log(data.matKhau,'lakdfladf')
                console.log(hashPasswordFromBcrypt)
                await db.Members.create({
                    email: data.email,
                    tenThanhVien: data.tenThanhVien,
                    anhDaiDien: data.anhDaiDien,
                    anhCK: data.anhCK,
                    soDienThoai: data.soDienThoai,
                    diaChi: data.diaChi,
                    gioiTinh: data.gioiTinh,
                    matKhau: hashPasswordFromBcrypt,
                    tienTk:0,
                    status:0
                })
              
                resolve({
                    errCode: 0,
                    errMessage: "Ok", 
                })
            
            }
           
        } catch (error) {
            reject(error)
        }
         
     }) 
}
let handleUserMembersLogin = (email, password)=>{
    console.log(password)
    return new Promise(async (resolve, reject)=>{
        try {
            let userData = {};
            let isExit = await checkUserEmail(email)
            if(isExit){
                let user = await db.Members.findOne({ 
                    
                    where: {email: email},
                   
                    
                })
                if(user){
                   
                  let checkPassword =  bcrypt.compareSync(password,user.matKhau)
                 
                  console.log(user.matKhau)
                  if(checkPassword){
                    userData.errCode = 0;
                    userData.errMessage = "Đăng nhập thành công";
                    delete user.matKhau;
                    userData.user = user 
                  }else{
                    userData.errCode = 3;
                    userData.errMessage = "Mật khẩu không chính xác"
                  }
                }else{
                    userData.errCode = 2;
                    userData.errMessage = "Email không tồn tại, hãy thử lại 1 email khác";
                }
                console.log(user)
                
            }else{
                userData.errCode = 4;
                userData.errMessage = "Email không tồn tại, hãy thử lại 1 email khác";

               
            }
            resolve(userData)
        } catch (error) {
            reject(error);
        }
    })
}
module.exports  = {
    AddMembersService:AddMembersService,
    handleUserMembersLogin:handleUserMembersLogin,
    ProfileMembersService:ProfileMembersService,
    EditProfileMembersService:EditProfileMembersService
    
    
}