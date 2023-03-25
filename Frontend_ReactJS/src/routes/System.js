import React, { Component } from 'react';
import { connect } from "react-redux";
import { Redirect, Route, Switch } from 'react-router-dom';
import UserManage from '../containers/System/UserManage';
import ProductManage from '../containers/System/products/ProductManage';
import Categories from '../containers/System/Categories';
import Members from '../containers/System/members/Members';

import Header from '../containers/Header/Header';
class System extends Component {
    render() {
        // {this.props.isLoggedIn && <Header />}
        const { systemMenuPath,isLoggedIn } = this.props;
        return (
            <React.Fragment>
               {this.props.isLoggedIn && <Header />}
                <div className="system-container">
                <div className="system-list">
                    <Switch>
                        <Route path="/system/user-manage" component={UserManage} />
                        <Route path="/system/user-member" component={Members} />
                        <Route path="/system/product-manage" component={ProductManage} />
                        <Route path="/system/categories" component={Categories} />
                        <Route component={() => { return (<Redirect to={systemMenuPath} />) }} />
                    </Switch>
                </div>
            </div>
            </React.Fragment>
            
        );
    }
}

const mapStateToProps = state => {
    return {
        systemMenuPath: state.app.systemMenuPath,
        isLoggedIn: state.user.isLoggedIn
    };
};

const mapDispatchToProps = dispatch => {
    return {
    };
};

export default connect(mapStateToProps, mapDispatchToProps)(System);
