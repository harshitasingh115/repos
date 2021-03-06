﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Travel.Home" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<%--    <script src="Scripts/angular.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <script>
        var app = angular.module('Myapp', []);
        app.controller('Mycontroller', function ($scope)
        {
            $scope.showPassword = false;
            $scope.toggleShowPassword = function ()
            {
                $scope.showPassword = !$scope.showPassword;
            }
        });
    </script>--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script type="text/javascript">  
        $(document).ready(function () {  
            $('#show_password').hover(function show() {  
                //Change the attribute to text  
                $('#txtUserPassword').attr('type', 'text');  
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');  
            },  
            function () {  
                //Change the attribute back to password  
                $('#txtUserPassword').attr('type', 'password');  
                $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');  
            });  
            //CheckBox Show Password  
            $('#ShowPassword').click(function () {  
                $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');  
            });  
        });  
    </script>  

    <style type="text/css">
        .auto-style1 {
            width: 99%;
            height: 216px;
            margin-left: 6px;
            text-align: center;
            font-size: xx-large;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style4 {
            margin-left: 0px;
            margin-top: 0px;
        }
        .newStyle1 {
            font-family: "Times New Roman", Times, serif;
            font-size: large;
        }
        .auto-style35 {
            width: 100%;
            height: 100%;
            margin-bottom: 6px;
        }
        .auto-style37 {
            margin-left: 794px;
            margin-right: 155px;
        }
        .auto-style40 {
            text-align: left;
        }
        .auto-style41 {
            height: 81px;
            width: 323px;
            margin-left: 0px;
        }
        .auto-style42 {
            text-align: center;
        }
        .auto-style43 {
            width: 91%;
            margin-left: 81px;
            height: 27px;
            margin-right: 0px;
            margin-top: 0px;
            text-align: center;
            margin-bottom: 5px;
        }
        .auto-style44 {
            width: 198px;
        }
        .auto-style45 {
            margin-left: 0px;
            width: 269px;
        }
        </style>
</head>
<body style="background-image:url('Image/On1Call.png'); background-repeat:no-repeat;width: 98%; height: 805px; padding:0px 0px 0px 0px; margin:0px 0px 0px 0px;">
    <form id="form1" runat="server" class="auto-style35">
        <div class="auto-style1">
            <strong>
            <br />
            <br />
            Travel Summary<br />
            <br />
            <br />
            <br />
            </strong></div>
        <h1 class="auto-style42">
            <strong><asp:Label ID="lblUser" runat="server" Text="User Login"></asp:Label>
            :</strong> <asp:TextBox ID="txtUserLogin" runat="server" CssClass="auto-style3" Width="194px" Height="29px"></asp:TextBox>
                                      
            <strong>&nbsp;&nbsp;&nbsp; </strong>
        </h1>
        
        <h1 class="auto-style42">
<%--            <div ng-app="Myapp" ng-controller="Mycontroller"></div>--%>
            <strong>&nbsp;&nbsp;&nbsp;&nbsp; Password</strong>:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtUserPassword" runat="server" CssClass="auto-style4" TextMode="Password" Width="194px" Height="29px"></asp:TextBox>
              &nbsp;
              <button id="show_password" class="btn btn-primary" type="button">  
                                <span class="fa fa-eye-slash icon"></span>  
                            </button>  
            &nbsp;</h1>
<%--        <div class="container">  
            <h2>Show or Hide Password</h2>  
            <div class="row">  
                <div class="col-md-6">  
                    <p>Hover on the eye to show/hide the password</p>  
                    <label>Password</label>  
                    <div class="input-group">  
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>  
                        <div class="input-group-append">  

                        </div>  
                        </div> 
                    </div> 
                </div> 
            </div> --%>
   <%--      <div>
            <div ng-app="Myapp" ng-controller="Mycontroller"></div>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" ng-attr-type="{{showPassword ? 'text':'password'}}"></asp:TextBox>
            <div id="showhidediv" ng-click="toggleShowPassword()" ng-class="{'fa fa-eye':showPassword, 'fa fa-eye-slash': !showPassword}">Show Password</div>
</div>       <div id="showhidediv" ng-click="toggleShowPassword()" ng-class="{'fa fa-eye': showPassword, 'fa fa-eye-slash':!showPassword}">Show/Hide</div>--%>
        <h5 class="auto-style42">
            <asp:Button ID="btnLogin" BackColor="YellowGreen" ForeColor="White" Font-Bold="true" runat="server" CssClass="auto-style4" OnClick="btnLogin_Click" Text="Login" Width="129px" Height="39px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="txtSignUp" BackColor="YellowGreen" ForeColor="White" Font-Bold="true"  runat="server" Height="39px" Text="Sign Up" Width="129px" OnClick="txtSignUp_Click" />
        </h5>
        <p class="auto-style42">
            <asp:Label ID="lblWarning" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="Red"></asp:Label>
        </p>
        <p class="auto-style43">
            <asp:Label ID="lblCode" runat="server" Text="Label" Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUserInfo" runat="server"></asp:Label>
            <asp:LinkButton ID="lblForgot" runat="server" OnClick="lblForgot_Click">Forgot Password?</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div>
                <asp:PasswordRecovery ID="PasswordRecovery1" Visible="false" runat="server" CssClass="auto-style37" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Height="37px" Width="333px">
                <SubmitButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <SuccessTextStyle Font-Bold="True" ForeColor="#5D7B9D" />
                <TextBoxStyle Font-Size="0.8em" />
                <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                <UserNameTemplate>
                    <table cellpadding="4" cellspacing="0" style="border-collapse:collapse; " class="auto-style45">
                        <tr>
                            <td class="auto-style44">
                                <table cellpadding="0" class="auto-style41" align="center">
                                    <tr>
                                        <td align="center" colspan="2" style="color:White;background-color:#5D7B9D;font-size:0.9em;font-weight:bold;">Forgot Your Password?</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Black;font-style:italic;">Enter your email to receive your password.</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style40">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" Height="16px" Width="198px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="SubmitButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Submit" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" Text="Submit" ValidationGroup="PasswordRecovery1" OnClick="SubmitButton_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </UserNameTemplate>
            </asp:PasswordRecovery>
            </div>
        </p>


    </form>
</body>
</html>
