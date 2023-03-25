import React, { Component } from 'react';
import { FormattedMessage } from 'react-intl';
import { connect } from 'react-redux';
import ModalMembers from './ModalMembers';
import ModalEditMembers from './ModalEditMembers';
import { getAllMembers } from '../../../services/membersService';
import * as actions from '../../../store/actions'
import CurrencyFormat from 'react-currency-format';
class Members extends Component {

    constructor(props) {
        super(props);

    }
    handleAddNewMembers = ()=>{
        this.setState({
            isOpenModal: true
        })
    }
    toggleMembersModal = ()=>{
        this.setState({
            isOpenModal: !this.state.isOpenModal
        })
    }


    render() {
        return (
            <div className="container members-container">
            {/* <ModalMembers
                isOpen = {this.state.isOpenModal}
                test = {'abc'}
                toggleFromParent = {this.toggleMembersModal}
                createNewMembers = {this.createNewMembers}
            />
            {this.state.isOpenEditMembersModal &&
                <ModalEditMembers
                isOpen = {this.state.isOpenEditMembersModal}
                toggleFromParent = {this.toggleEditMembersModal}
                currentMembers = {this.state.membersEdit}
                 
            />
                
            } */}
             
            <div className='title text-center'> Read Members</div>
            <div className='mx-2'>
                <button className='btn btn-primary px-2' onClick={()=>this.handleAddNewMembers()}> <i className='fas fa-plus px-2'></i>Add new members</button>
            </div>
            <div className='members-table mt-4 mx-2'>
            <table id="customers" class="ws-table-all px-5">
                <tbody>
                    <tr>
                        <th>Ảnh</th>
                        <th>Tên người dùng</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>soLuong</th>
                        <th>Sale</th>
                        <th>Hot</th>
                        <th>lượt xem</th>
                        <th>lượt mua</th>
                        <th>Action</th>
                    </tr>
                    {/* {
                    arrMembers && arrMembers.map((item,index) =>{
                    return(
                        <>
                            <tr>
                                <td style={{display:'flex',justifyContent:'center',alignItems:'center'}}>
                                    {item.image&&
                                    <img style={{width:'250px'}} src={this.showImage(item.image)}/> 
                                }
                                
                                </td>
                                
                                <td>{item.tenSp}</td>
                                <td>
                               { arrCategories && arrCategories.map((item2,index) =>{
                                    return(
                                        <>
                                            {item.idDanhSach&&item.idDanhSach === item2.id? item2.name :""}
                                        </>
                                        
                                    ) })}
                                </td>
                                <td>{item.hangSx}</td>
                                <td>{this.price(item.giaSanPham)}</td>
                                <td>{item.soLuong}</td>
                                <td>{item.sale+ " %"}</td>
                                <td>{item.hot === 1? <i class="fas fa-check"></i>: ''}</td>
                                <td>{item.luotXem}</td>
                                <td>{item.luotMua}</td>
                                <td className='action'>
                                <button onClick={()=>this.handleEditMembers(item)} class="btn btn-success mx-1 px-2 ">Edit</button>
                                <button onClick={()=>this.handleDeleteMembers(item.id)} class="btn btn-danger  px-2">Delete</button>
                                </td>
                            </tr>
                        </>
                    )
                     
                })} */}
                
                
              
                    
                    
                </tbody></table>
               
            </div>
        </div>
        )
    }

}

const mapStateToProps = state => {
    return {

    };
};

const mapDispatchToProps = dispatch => {
    return {
    };
};

export default connect(mapStateToProps, mapDispatchToProps)(Members);
