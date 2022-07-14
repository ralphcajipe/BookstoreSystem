<!-- Section-->
<!-- A CSS code that is used to style the image. -->
<style>
    .book-cover {
        object-fit: contain !important;
        height: auto !important;
    }
</style>

<!-- An announcement to display "new releases!" -->
<div class="container px-1 px-lg-1 my-1">
    <div class="text-center text-red">
        <h3 class="display-5">new releases!</h3>
    </div>
</div>

<section class="py-0"> <!-- This is the spacing for the "new releases" -->
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <?php
            /* A PHP code that is fetching data from the database and displaying it on the page. */
            $products = $conn->query("SELECT * FROM `products` where status = 1 order by rand() limit 8 ");
            while ($row = $products->fetch_assoc()) :
                $upload_path = base_app . '/uploads/product_' . $row['id'];
                $img = "";
                if (is_dir($upload_path)) {
                    $fileO = scandir($upload_path);
                    if (isset($fileO[2]))
                        $img = "uploads/product_" . $row['id'] . "/" . $fileO[2];
                    // var_dump($fileO);
                }
                foreach ($row as $k => $v) {
                    $row[$k] = trim(stripslashes($v));
                }
                $inventory = $conn->query("SELECT * FROM inventory where product_id = " . $row['id']);
                $inv = array();
                while ($ir = $inventory->fetch_assoc()) {
                    $inv[] = number_format($ir['price']);
                }
            ?>
                <div class="col mb-5">
                    <div class="card product-item">
                        <!-- Product image-->
                        <img class="card-img-top w-100 book-cover" src="<?php echo validate_image($img) ?>" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="">
                                <!-- Product name-->
                                <h5 class="fw-bolder"><?php echo $row['title'] ?></h5>
                                <!-- Product price-->
                                <?php
                                /* Looping through the array and displaying the price. */
                                foreach ($inv as $k => $v) :
                                ?>
                                    <span><b>Price: </b><?php echo $v ?></span>
                                <?php endforeach; ?>
                            </div>
                            <p class="m-0"><small>By: <?php echo $row['author'] ?></small></p>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-flat btn-primary " href=".?p=view_product&id=<?php echo md5($row['id']) ?>">View</a>
                            </div>

                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        </div>
    </div>
</section>