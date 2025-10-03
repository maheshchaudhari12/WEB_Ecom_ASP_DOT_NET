<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductTable.aspx.cs" Inherits="WEB_Ecom_ASP_DOT_NET.ProductTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 2rem;
            border-radius: 12px;
            margin-bottom: 2rem;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.2);
        }

        .page-header h2 {
            color: white;
            font-weight: 700;
            margin: 0;
            font-size: 1.75rem;
        }

        .page-header p {
            color: rgba(255, 255, 255, 0.9);
            margin: 0.5rem 0 0 0;
            font-size: 0.95rem;
        }

        .stats-card {
            background: white;
            border-radius: 10px;
            padding: 1.25rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .stats-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
        }

        .stats-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
        }

        .stats-icon.primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .stats-content h4 {
            margin: 0;
            font-size: 1.5rem;
            font-weight: 700;
            color: #1e293b;
        }

        .stats-content p {
            margin: 0;
            color: #64748b;
            font-size: 0.875rem;
        }

        .table-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .table-card-header {
            padding: 1.5rem;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .table-card-header h3 {
            margin: 0;
            font-size: 1.25rem;
            font-weight: 600;
            color: #1e293b;
        }

        .table-actions {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .table-card-body {
            padding: 1.5rem;
        }

        /* Custom GridView Styling */
        .table-responsive {
            border-radius: 8px;
            overflow-x: auto;
        }

        .table {
            margin-bottom: 0;
            font-size: 0.9rem;
        }

        .table thead th {
            background: linear-gradient(135deg, #1e293b 0%, #334155 100%);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.5px;
            padding: 1rem 0.75rem;
            border: none;
            white-space: nowrap;
        }

        .table tbody tr {
            transition: all 0.2s ease;
        }

        .table tbody tr:hover {
            background-color: #f8fafc;
            transform: scale(1.01);
        }

        .table tbody td {
            padding: 1rem 0.75rem;
            vertical-align: middle;
            border-color: #e2e8f0;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(248, 250, 252, 0.5);
        }

        /* Button Styling */
        .btn-sm {
            padding: 0.4rem 0.8rem;
            font-size: 0.813rem;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .btn-warning {
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
            border: none;
            color: white;
        }

        .btn-warning:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(245, 158, 11, 0.3);
        }

        .btn-danger {
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            border: none;
        }

        .btn-danger:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(239, 68, 68, 0.3);
        }

        .btn-success {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            border: none;
        }

        .btn-success:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(16, 185, 129, 0.3);
        }

        .btn-primary {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            border: none;
        }

        .btn-primary:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(59, 130, 246, 0.3);
        }

        /* Modal Styling */
        .modal-content {
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }

        .modal-header {
            border-radius: 12px 12px 0 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .modal-header .btn-close {
            filter: brightness(0) invert(1);
        }

        .modal-footer {
            border-top: 1px solid #e2e8f0;
            padding: 1.25rem;
        }

        .form-label {
            font-weight: 600;
            color: #475569;
            font-size: 0.875rem;
            margin-bottom: 0.5rem;
        }

        .form-control {
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            padding: 0.6rem 0.9rem;
            transition: all 0.2s ease;
        }

        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        /* Alert Styling */
        .alert {
            border-radius: 10px;
            border: none;
            padding: 1rem 1.25rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        }

        /* Responsive Adjustments */
        @media (max-width: 991px) {
            .page-header {
                padding: 1.5rem;
            }

            .page-header h2 {
                font-size: 1.5rem;
            }

            .table-card-body {
                padding: 1rem;
            }

            .stats-card {
                padding: 1rem;
            }
        }

        @media (max-width: 767px) {
            .page-header {
                padding: 1.25rem;
            }

            .page-header h2 {
                font-size: 1.25rem;
            }

            .table-card-header {
                padding: 1rem;
            }

            .table-card-body {
                padding: 0.75rem;
            }

            .table {
                font-size: 0.813rem;
            }

            .table thead th {
                font-size: 0.688rem;
                padding: 0.75rem 0.5rem;
            }

            .table tbody td {
                padding: 0.75rem 0.5rem;
            }

            .btn-sm {
                padding: 0.35rem 0.6rem;
                font-size: 0.75rem;
            }

            .stats-card {
                flex-direction: column;
                text-align: center;
            }
        }

        @media (max-width: 575px) {
            .table-actions {
                width: 100%;
            }

            .table-actions .btn {
                flex: 1;
            }
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem 1rem;
            color: #64748b;
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }

        .empty-state h4 {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .empty-state p {
            margin-bottom: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        
        <!-- Page Header -->
        <div class="page-header">
            <h2><i class="fas fa-box me-2"></i>Products Management</h2>
            <p>View, edit, and manage your product inventory</p>
        </div>

        <!-- Stats Cards (Optional - can be populated from code-behind) -->
        <div class="row mb-4">
            <div class="col-md-4 col-sm-6 mb-3">
                <div class="stats-card">
                    <div class="stats-icon primary">
                        <i class="fas fa-boxes"></i>
                    </div>
                    <div class="stats-content">
                        <h4 id="totalProducts">0</h4>
                        <p>Total Products</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 mb-3">
                <div class="stats-card">
                    <div class="stats-icon" style="background: linear-gradient(135deg, #10b981 0%, #059669 100%);">
                        <i class="fas fa-tags"></i>
                    </div>
                    <div class="stats-content">
                        <h4 id="totalCategories">0</h4>
                        <p>Categories</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 mb-3">
                <div class="stats-card">
                    <div class="stats-icon" style="background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="stats-content">
                        <h4 id="avgPrice">$0</h4>
                        <p>Average Price</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Alert Placeholder -->
        <asp:Literal ID="litAlert" runat="server" />

        <!-- Products Table Card -->
        <div class="table-card">
            <div class="table-card-header">
                <h3><i class="fas fa-list me-2"></i>All Products</h3>
                <div class="table-actions">
                    <a href="AddProduct.aspx" class="btn btn-primary btn-sm">
                        <i class="fas fa-plus me-1"></i>Add New Product
                    </a>
                    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="window.print()">
                        <i class="fas fa-print me-1"></i>Print
                    </button>
                </div>
            </div>
            
            <div class="table-card-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-hover table-striped align-middle"
                        DataKeyNames="ProductID" 
                        OnRowEditing="gvProducts_RowEditing"
                        OnRowUpdating="gvProducts_RowUpdating" 
                        OnRowCancelingEdit="gvProducts_RowCancelingEdit"
                        OnRowDeleting="gvProducts_RowDeleting"
                        EmptyDataText="No products found. Add your first product to get started!">
                        <HeaderStyle CssClass="table-dark" />
                        <Columns>
                            <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" 
                                ItemStyle-Width="60px" HeaderStyle-Width="60px" />
                            <asp:BoundField DataField="Name" HeaderText="Product Name" 
                                ItemStyle-Width="200px" />
                            <asp:TemplateField HeaderText="Image" ItemStyle-Width="80px" HeaderStyle-Width="80px">
                                <ItemTemplate>
                                    <img src='<%# Eval("ImageUrl") %>' alt="Product" 
                                         style="width: 50px; height: 50px; object-fit: cover; border-radius: 6px;" 
                                         onerror="this.src='https://via.placeholder.com/50'" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                ItemStyle-Width="300px" />
                            <asp:TemplateField HeaderText="Price" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <span style="font-weight: 600; color: #059669;">
                                        $<%# Eval("Price", "{0:F2}") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Category" HeaderText="Category" 
                                ItemStyle-Width="120px" />
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="150px" 
                                HeaderStyle-Width="150px" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Text="✏️ Edit" 
                                        CssClass="btn btn-sm btn-warning me-1" 
                                        CommandName="Edit" />
                                    <asp:Button ID="btnDelete" runat="server" Text="🗑️ Delete" 
                                        CssClass="btn btn-sm btn-danger" 
                                        CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this product?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="empty-state">
                                <i class="fas fa-box-open"></i>
                                <h4>No Products Found</h4>
                                <p>Start by adding your first product to the inventory</p>
                                <a href="AddProduct.aspx" class="btn btn-primary mt-3">
                                    <i class="fas fa-plus me-2"></i>Add First Product
                                </a>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Edit Product Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="editModalLabel">
                            <i class="fas fa-edit me-2"></i>Edit Product
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <asp:HiddenField ID="hfProductID" runat="server" />
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Product Name</label>
                                <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control" 
                                    placeholder="Enter product name" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Category</label>
                                <asp:TextBox ID="txtEditCategory" runat="server" CssClass="form-control" 
                                    placeholder="Enter category" />
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Image URL</label>
                            <asp:TextBox ID="txtEditImageUrl" runat="server" CssClass="form-control" 
                                placeholder="https://example.com/image.jpg" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <asp:TextBox ID="txtEditDescription" runat="server" TextMode="MultiLine" 
                                Rows="3" CssClass="form-control" placeholder="Enter product description" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Price ($)</label>
                            <asp:TextBox ID="txtEditPrice" runat="server" CssClass="form-control" 
                                placeholder="0.00" TextMode="Number" step="0.01" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            ✖️ Cancel
                        </button>
                        <asp:Button ID="btnUpdateProduct" runat="server" Text="✔️ Update Product" 
                            CssClass="btn btn-success" OnClick="btnUpdateProduct_Click" />
                    </div>
                </div>
            </div>
        </div>

    </form>

    <script>
        // Update stats dynamically (you can populate this from code-behind)
        document.addEventListener('DOMContentLoaded', function() {
            // Count rows in GridView
            var table = document.querySelector('#<%= gvProducts.ClientID %>');
            if (table) {
                var rows = table.querySelectorAll('tbody tr');
                var productCount = rows.length - 1;

                // Filter out empty data row
                if (rows.length === 1 && rows[0].querySelector('.empty-state')) {
                    productCount = 0;
                }

                document.getElementById('totalProducts').textContent = productCount;
            }
        });
    </script>
</asp:Content>
