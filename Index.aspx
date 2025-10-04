<%@ Page Title="Home - Dev Shop" Language="C#" MasterPageFile="~/Home_Page.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WEB_Ecom_ASP_DOT_NET.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Hero Section */
        .hero-section {
            position: relative;
            overflow: hidden;
        }

        .carousel-image {
            width: 100%;
            height: 400px;
            object-fit: initial;
        }

        .carousel-caption-custom {
            position: absolute;
            top: 50%;
            left: 10%;
            transform: translateY(-50%);
            text-align: left;
            color: white;
            z-index: 10;
            max-width: 600px;
        }

            .carousel-caption-custom h1 {
                font-size: 3.5rem;
                font-weight: bold;
                text-shadow: 2px 2px 8px rgba(0,0,0,0.7);
                margin-bottom: 20px;
            }

            .carousel-caption-custom p {
                font-size: 1.3rem;
                text-shadow: 1px 1px 4px rgba(0,0,0,0.7);
                margin-bottom: 30px;
            }

        .hero-btn {
            padding: 15px 40px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 50px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        /* Features Section */
        .features-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 60px 0;
            color: white;
        }

        .feature-box {
            text-align: center;
            padding: 30px 20px;
        }

        .feature-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            display: inline-block;
            padding: 20px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            width: 100px;
            height: 100px;
            line-height: 60px;
        }

        .feature-box h4 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .feature-box p {
            opacity: 0.9;
        }

        /* Product Cards */
        .product-card-home {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: white;
            height: 100%;
        }

            .product-card-home:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            }

        .product-image-home {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .product-body {
            padding: 25px;
        }

        .product-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }

        .product-description {
            color: #666;
            margin-bottom: 20px;
        }

        .product-stats {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 10px;
        }

        .stat-item {
            text-align: center;
        }

        .stat-label {
            font-size: 0.85rem;
            color: #666;
            margin-bottom: 5px;
        }

        .stat-value {
            font-size: 1.2rem;
            font-weight: bold;
            color: #28a745;
        }

        .add-cart-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

            .add-cart-btn:hover {
                transform: scale(1.05);
                box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
            }

        /* CTA Section */
        .cta-section {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            padding: 80px 0;
            color: white;
            text-align: center;
        }

            .cta-section h2 {
                font-size: 2.5rem;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .cta-section p {
                font-size: 1.2rem;
                margin-bottom: 30px;
                opacity: 0.95;
            }

        /* Categories Section */
        .category-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            cursor: pointer;
            height: 100%;
        }

            .category-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            }

        .category-icon {
            font-size: 3.5rem;
            margin-bottom: 20px;
            color: #667eea;
        }

        .category-card h4 {
            font-size: 1.3rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
        }

        .category-card p {
            color: #666;
            font-size: 0.95rem;
        }

        /* Stats Section */
        .stats-section {
            background: #f8f9fa;
            padding: 60px 0;
        }

        .stat-box {
            text-align: center;
            padding: 30px;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 10px;
        }

        .stat-text {
            font-size: 1.1rem;
            color: #666;
        }

        /* Section Padding */
        .section-padding {
            padding: 80px 0;
        }

        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }

            .section-title h2 {
                font-size: 2.5rem;
                font-weight: bold;
                color: #333;
                margin-bottom: 15px;
            }

            .section-title p {
                font-size: 1.1rem;
                color: #666;
            }

        @media (max-width: 768px) {
            .carousel-caption-custom {
                left: 5%;
                max-width: 90%;
            }

                .carousel-caption-custom h1 {
                    font-size: 2rem;
                }

            .carousel-image {
                height: 300px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Hero Carousel Section -->
    <section class="hero-section hero-section-full-height">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-12 p-0">
                    <div id="hero-slide" class="carousel slide carousel-fade" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#hero-slide" data-bs-slide-to="0" class="active"></button>
                            <button type="button" data-bs-target="#hero-slide" data-bs-slide-to="1"></button>
                            <button type="button" data-bs-target="#hero-slide" data-bs-slide-to="2"></button>
                        </div>

                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="https://rukminim2.flixcart.com/fk-p-flap/3240/540/image/c97db7f0588971b6.jpeg?q=60" class="carousel-image img-fluid " alt="Banner 1">
                                <div class="carousel-caption-custom">
                                    <h1>Premium Phone</h1>
                                    <p>Everything you need in a SmartPhone</p>
                                    <a href="CardsProducts.aspx" class="btn btn-light btn-lg hero-btn">Shop Now →</a>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <img src="https://rukminim2.flixcart.com/fk-p-flap/3240/540/image/5abb4d563d966055.jpg?q=60" class="carousel-image img-fluid" alt="Banner 2">
                                <div class="carousel-caption-custom">
                                    <a href="CardsProducts.aspx" class="btn btn-warning btn-lg hero-btn">Explore →</a>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <img src="https://rukminim2.flixcart.com/fk-p-flap/3240/540/image/7db1ac2afe62ce40.jpeg?q=60" class="carousel-image img-fluid" alt="Banner 3">
                                <div class="carousel-caption-custom">
                                    <h1>Special Offers</h1>
                                    <p>Save big on essential development tools</p>
                                    <a href="CardsProducts.aspx" class="btn btn-success btn-lg hero-btn">Get Deals →</a>
                                </div>
                            </div>
                        </div>

                        <button class="carousel-control-prev" type="button" data-bs-target="#hero-slide" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#hero-slide" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features-section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="feature-box">
                        <div class="feature-icon">
                            <i class="fas fa-shipping-fast"></i>
                        </div>
                        <h4>Free Shipping</h4>
                        <p>On orders over $50</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="feature-box">
                        <div class="feature-icon">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <h4>Secure Payment</h4>
                        <p>100% secure transactions</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="feature-box">
                        <div class="feature-icon">
                            <i class="fas fa-undo"></i>
                        </div>
                        <h4>Easy Returns</h4>
                        <p>30-day return policy</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="feature-box">
                        <div class="feature-icon">
                            <i class="fas fa-headset"></i>
                        </div>
                        <h4>24/7 Support</h4>
                        <p>Always here to help</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="section-padding">
        <div class="container">
            <div class="section-title">
                <h2>Shop by Category</h2>
                <p>Find exactly what you're looking for</p>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="fas fa-microchip"></i>
                        </div>
                        <h4>CPUs & Processors</h4>
                        <p>High-performance computing power for your builds</p>
                        <a href="CardsProducts.aspx" class="btn btn-outline-primary mt-3">Browse</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="fas fa-memory"></i>
                        </div>
                        <h4>Motherboards</h4>
                        <p>The foundation for powerful systems</p>
                        <a href="CardsProducts.aspx" class="btn btn-outline-primary mt-3">Browse</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="category-card">
                        <div class="category-icon">
                            <i class="fas fa-desktop"></i>
                        </div>
                        <h4>Graphics Cards</h4>
                        <p>Ultimate visual performance and rendering</p>
                        <a href="CardsProducts.aspx" class="btn btn-outline-primary mt-3">Browse</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Products Section -->
    <section class="section-padding" style="background: #f8f9fa;">
        <div class="container">
            <div class="section-title">
                <h2>Featured Products</h2>
                <p>Top picks from our collection</p>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="product-card-home">
                        <img src="https://mdcomputers.in/image/catalog/2025/sep/22-09-25/popular-category/cpu.webp" class="product-image-home" alt="CPU">
                        <div class="product-body">
                            <h5 class="product-title">High-End Processors</h5>
                            <p class="product-description">Latest generation CPUs for demanding workloads and gaming</p>
                            <div class="product-stats">
                                <div class="stat-item">
                                    <div class="stat-label">Starting at</div>
                                    <div class="stat-value">$299</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-label">In Stock</div>
                                    <div class="stat-value">50+</div>
                                </div>
                            </div>
                            <a href="CardsProducts.aspx" class="btn add-cart-btn">View Products</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="product-card-home">
                        <img src="https://mdcomputers.in/image/catalog/2025/sep/22-09-25/popular-category/moherboard.webp" class="product-image-home" alt="Motherboard">
                        <div class="product-body">
                            <h5 class="product-title">Premium Motherboards</h5>
                            <p class="product-description">Feature-rich boards with advanced connectivity and overclocking</p>
                            <div class="product-stats">
                                <div class="stat-item">
                                    <div class="stat-label">Starting at</div>
                                    <div class="stat-value">$149</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-label">In Stock</div>
                                    <div class="stat-value">30+</div>
                                </div>
                            </div>
                            <a href="CardsProducts.aspx" class="btn add-cart-btn">View Products</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="product-card-home">
                        <img src="https://mdcomputers.in/image/catalog/2025/sep/22-09-25/popular-category/graphics-card.webp" class="product-image-home" alt="Graphics Card">
                        <div class="product-body">
                            <h5 class="product-title">Graphics Cards</h5>
                            <p class="product-description">Cutting-edge GPUs for gaming, design, and machine learning</p>
                            <div class="product-stats">
                                <div class="stat-item">
                                    <div class="stat-label">Starting at</div>
                                    <div class="stat-value">$399</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-label">In Stock</div>
                                    <div class="stat-value">25+</div>
                                </div>
                            </div>
                            <a href="CardsProducts.aspx" class="btn add-cart-btn">View Products</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stat-box">
                        <div class="stat-number">10K+</div>
                        <div class="stat-text">Happy Customers</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stat-box">
                        <div class="stat-number">500+</div>
                        <div class="stat-text">Products</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stat-box">
                        <div class="stat-number">50+</div>
                        <div class="stat-text">Brands</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stat-box">
                        <div class="stat-number">24/7</div>
                        <div class="stat-text">Support</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <h2>Ready to Build Your Dream Setup?</h2>
            <p>Explore our full catalog and find everything you need</p>
            <a href="CardsProducts.aspx" class="btn btn-light btn-lg hero-btn">Start Shopping</a>
        </div>
    </section>

</asp:Content>
