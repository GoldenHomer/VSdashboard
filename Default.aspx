<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.1.3.min.js"></script>
    <script src="Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>
</head>
<body onunload="pageunload()">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="dashboard" style="background-color:azure; width:100%; margin:20px;">
            <div class="dashboard">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                     <ContentTemplate>
                         <asp:DropDownList ID="themelist" runat="server">
                             <asp:ListItem>Blue</asp:ListItem>
                             <asp:ListItem Selected="True">Coral</asp:ListItem>
                             <asp:ListItem>Azure</asp:ListItem>
                         </asp:DropDownList>
                     </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="dashboard">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DetailsView ID="DetailsView1" runat="server" Height="58px" Width="328px" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="empid" DataSourceID="namestableDatasource" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="empid" HeaderText="Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="empid" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
                        <asp:SqlDataSource ID="namestableDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:sampConnectionString %>" DeleteCommand="DELETE FROM [namestable] WHERE [empid] = @empid" InsertCommand="INSERT INTO [namestable] ([name]) VALUES (@name)" SelectCommand="SELECT [empid], [name] FROM [namestable]" UpdateCommand="UPDATE [namestable] SET [name] = @name WHERE [empid] = @empid">
                <DeleteParameters>
                    <asp:Parameter Name="empid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="empid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="dashboard">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:DynamicField DataField="id" HeaderText="Record ID" />
                                <asp:BoundField DataField="empid" HeaderText="Employee ID" SortExpression="empid" />
                                <asp:TemplateField HeaderText="Date Sold" SortExpression="datesold">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("datesold") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("datesold", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="monthonly" HeaderText="Month sold" SortExpression="monthonly" />
                                <asp:TemplateField HeaderText="Transcation Amount" SortExpression="amount">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("amount") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("amount", "{0:C}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sampConnectionString %>" SelectCommand="SELECT [id], [empid], [monthonly], [datesold], [amount] FROM [salestable] WHERE ([empid] = @empid)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DetailsView1" Name="empid" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>

                
            </div>
            
            <div id="insidediv">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="332px" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource3">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                                <EditRowStyle BackColor="#999999" />
                                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                                <Fields>
                                    <asp:BoundField DataField="id" HeaderText="Record ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="empid" HeaderText="Employee ID" SortExpression="empid" />
                                    <asp:TemplateField HeaderText="Date Sold" SortExpression="datesold">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("datesold", "{0:d}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("datesold") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("datesold", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="monthonly" HeaderText="Month Sold" SortExpression="monthonly" />
                                    <asp:TemplateField HeaderText="Sale Amount" SortExpression="amount">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("amount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("amount") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("amount", "{0:C}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                                </Fields>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:sampConnectionString %>" DeleteCommand="DELETE FROM [salestable] WHERE [id] = @original_id AND (([empid] = @original_empid) OR ([empid] IS NULL AND @original_empid IS NULL)) AND (([monthonly] = @original_monthonly) OR ([monthonly] IS NULL AND @original_monthonly IS NULL)) AND (([amount] = @original_amount) OR ([amount] IS NULL AND @original_amount IS NULL)) AND (([datesold] = @original_datesold) OR ([datesold] IS NULL AND @original_datesold IS NULL))" InsertCommand="INSERT INTO [salestable] ([empid], [monthonly], [amount], [datesold]) VALUES (@empid, @monthonly, @amount, @datesold)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [empid], [monthonly], [amount], [datesold] FROM [salestable] WHERE ([id] = @id)" UpdateCommand="UPDATE [salestable] SET [empid] = @empid, [monthonly] = @monthonly, [amount] = @amount, [datesold] = @datesold WHERE [id] = @original_id AND (([empid] = @original_empid) OR ([empid] IS NULL AND @original_empid IS NULL)) AND (([monthonly] = @original_monthonly) OR ([monthonly] IS NULL AND @original_monthonly IS NULL)) AND (([amount] = @original_amount) OR ([amount] IS NULL AND @original_amount IS NULL)) AND (([datesold] = @original_datesold) OR ([datesold] IS NULL AND @original_datesold IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_id" Type="Int32" />
                                    <asp:Parameter Name="original_empid" Type="Int32" />
                                    <asp:Parameter Name="original_monthonly" Type="String" />
                                    <asp:Parameter Name="original_amount" Type="Decimal" />
                                    <asp:Parameter DbType="Date" Name="original_datesold" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="empid" Type="Int32" />
                                    <asp:Parameter Name="monthonly" Type="String" />
                                    <asp:Parameter Name="amount" Type="Decimal" />
                                    <asp:Parameter DbType="Date" Name="datesold" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="empid" Type="Int32" />
                                    <asp:Parameter Name="monthonly" Type="String" />
                                    <asp:Parameter Name="amount" Type="Decimal" />
                                    <asp:Parameter DbType="Date" Name="datesold" />
                                    <asp:Parameter Name="original_id" Type="Int32" />
                                    <asp:Parameter Name="original_empid" Type="Int32" />
                                    <asp:Parameter Name="original_monthonly" Type="String" />
                                    <asp:Parameter Name="original_amount" Type="Decimal" />
                                    <asp:Parameter DbType="Date" Name="original_datesold" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            <div class="dashboard">
                <!-- needs a data source with table that isn't wanting to work; #74 -->
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView2" runat="server"></asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            
            </div>

            <div class="dashboard">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem>Pie</asp:ListItem>
                            <asp:ListItem>Bar</asp:ListItem>
                            <asp:ListItem>Line</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <!-- Again, for table that isn't working -->
                        <asp:Chart ID="Chart1" runat="server">
                            <Series>
                                <asp:Series Name="Series1"></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <!-- notes saved with HTML5 local storage (see JS file)-->
            <div id="sticky" style="border:15px solid white; display:table;">
                <textarea id="TextArea1" runat="server" cols="20" rows="5" spellcheck="True" placeholder="Notes..."></textarea>
            </div>
        </div>
    </form>
</body>
</html>
