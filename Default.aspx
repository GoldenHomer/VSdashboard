<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.1.3.min.js"></script>
    <script src="Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $('.dashboard').draggable()
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="dashboard">
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
        
    </div>
        <div class="dashboard">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black">
                <Columns>
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
        </div>
    </form>
</body>
</html>
