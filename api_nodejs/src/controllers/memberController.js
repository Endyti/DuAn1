import memberService from "../services/memberService";

// let handleGetAllcategories = async (req, res) => {
    
  
//     try {
//         let data = await categoriesService.handleGetAllCategories();
//         return res.status(200).json(data) 
//      } catch (error) {
//          console.log("Lỗi phân quyền",error)
//         return res.status(200).json({
//              errCode: -1,
//              errMessage: 'Không kết nối được với sever'
//         })
//      }
   
// };
let handleAddMembers = async (req, res) => {
    
  
        
    try {
       
        let message = await  memberService.AddMembersService(req.body)
        console.log(message)
        return res.status(200).json(message)
     } catch (error) {
         console.log("Lỗi phân quyền",error)
        return res.status(200).json({
             errCode: -1,
             errMessage: 'Không kết nối được với sever'
        })
     }
   
   
};
let handleProfileMember = async (req, res) => {
    
  
    try {
        let id = req.body.id;
        console.log(id)
        let message = await  memberService.ProfileMembersService(id)
        console.log(message)
        return res.status(200).json(message)
     } catch (error) {
         console.log("Lỗi phân quyền",error)
        return res.status(200).json({
             errCode: -1,
             errMessage: 'Không kết nối được với sever'
        })
     }
   
};
let handleEditProfileMember = async (req, res) => {
    
  
    try {
        
        let message = await  memberService.EditProfileMembersService(req.body)
        console.log(message)
        return res.status(200).json(message)
     } catch (error) {
         console.log("Lỗi phân quyền",error)
        return res.status(200).json({
             errCode: -1,
             errMessage: 'Không kết nối được với sever'
        })
     }
   
};
let handleLoginMember = async (req, res) => {
    try {
        let email = req.body.email;
      
        let password = req.body.password;
        
        if(!email || !password){
            return res.status(500).json({
                errCode : 1,
                message : "Email và Password không được để trống"
            })
        }else{
            let userData = await memberService.handleUserMembersLogin(email, password)
            console.log(userData)
             return res.status(200).json({
            errCode: userData.errCode,
            message: userData.errMessage,
            user : userData.user?userData.user :{}
       
       
       
    })
        }
     } catch (error) {
         console.log("Lỗi phân quyền",error)
        return res.status(200).json({
             errCode: -1,
             errMessage: 'Không kết nối được với sever'
        })
     }
   
};

module.exports = {
    handleAddMembers:handleAddMembers,
    handleLoginMember:handleLoginMember,
    handleProfileMember:handleProfileMember,
    handleEditProfileMember:handleEditProfileMember
}