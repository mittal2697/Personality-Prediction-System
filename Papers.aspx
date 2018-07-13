<%@ Page Title="Online Test | Papers" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="Papers.aspx.cs" Inherits="Papers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="main-content">
				<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i><a href="#">Home</a></li>
                               <li> <a href="#">Subject</a></li>
                                <li class="active">Papers</li>
							
							
						</ul> 	<!--/.breadcrumb -->

						
					</div>

					<div class="page-content">
						


						<div class="row">

							<!-- /.col -->
                            <div class="col-md-12">
                            <div class="body-logo">
                            <img src="assets/images/main-logo.jpg" />
                             </div>
                             <div class="col-md-12">
                            <div class="banner">
                            <div class="col-md-8">
                            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
            
              <!-- Wrapper for slides -->
              <div class="carousel-inner" role="listbox">
                <div class="item">
                  <img src="assets/images/banner1.jpg" alt="...">
                  <div class="carousel-caption">
                   
                  </div>
                </div>
                <div class="item active">
                  <img src="assets/images/banner2.jpg" alt="...">
                  <div class="carousel-caption">
                   
                  </div>
                </div>
              </div>
              <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
                            </div>
                            <div class="col-md-4">
                            <div class=" new-announce">
                                        <h3 class=" title">
                                            New <span class="font-weight-300">Highlights</span></h3>
                                        <div class="list-wrpaaer">
                                            <ul class="list-aggregate" id="marquee-verticle">
                                                <asp:Repeater ID="dl_Notification" runat="server">
                                                    <ItemTemplate>
                                                        <li class="fat-l"><i class="fa fa-check-circle" aria-hidden="true"></i><a href='<%# Eval("Url")%>'>
                                                            <%# Eval("Notification")%></a> <span><i class="fa fa-calendar" aria-hidden="true"></i>
                                                                <%# Eval("NDate")%></span> </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                            </div>
                            

          
                            
                            </div>
                            </div>
                            <div class="col-md-12">
                            <div class="subject">
                             <h1>Online Test Papers</h1>
                        <p>Boost your exam preparation with Testbook to crack the most popular competitive exams in India.<br /> Select your course and get started.</p>
                            <div class="row">
                              <asp:Repeater ID="Repeater1" runat="server" 
                            onitemcommand="Repeater1_ItemCommand">
                        <ItemTemplate>



									<div class="col-md-3">
                                    <div class="papers">
                                    <div class="top-head">
                                    <h4><asp:Label ID="lblPaperName" runat="server" Text='<%#Eval("PaperName") %>'></asp:Label> </h4>
                                    
                                </div>
                                    <p><asp:Label ID="lblDescription" runat="server" Text='<%#Eval("Description") %>'></asp:Label> </p>
                                 
                                 <ul>
                                 <li><b>Questions:</b> <asp:Label ID="lblQuestions" runat="server" Text='<%#Eval("Questions") %>'></asp:Label> </li>
                                 <li><b>Time:</b> <asp:Label ID="lblTime" runat="server" Text='<%#Eval("MinTime") %>'></asp:Label> </li>
                                 <li><b>Marks/PQ:</b> <asp:Label ID="lblQuestionMarks" runat="server" Text='<%#Eval("QuestionMarks") %>'></asp:Label> </li>
                                 <li><b>-Ve:</b><asp:Label ID="lblNegativeMarks" runat="server" Text='<%#Eval("NegativeMarks") %>'></asp:Label> </li>
                                 </ul>
                                 <span class="input-group-btn">
                            <asp:LinkButton ID="LinkButton1" class="btn btn-sm btn-info no-radius" runat="server"><i class="ace-icon fa fa-share"></i>Take Test</asp:LinkButton>
																	 
																</span>
                                    
                                 <asp:Label ID="lblPaperId" runat="server" Visible="false" Text='<%#Eval("PaperId") %>'></asp:Label>
             
                                    </div>
                                    
                                    </div>
                                   </ItemTemplate>
                        </asp:Repeater>
                                    
                                   
								</div>
                            </div>
                            </div>

                            
                          



                            </div>
						</div><!-- /.row -->



                        
                        </div>
                        </div>
					</div>
</asp:Content>

