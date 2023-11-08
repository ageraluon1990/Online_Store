package com.example.buysell.services;

import com.example.buysell.models.Image;
import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.repositories.ProductRepo;
import com.example.buysell.repositories.UserRepo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepo productRepo;
    private final UserRepo userRepo;
//    private List<Product> products = new ArrayList<>();
//    private long ID = 0;
//    {
//        products.add(new Product(++ID,"Playstashion", "Simple", 50000,"Moskow", "Ya"));
//        products.add(new Product(++ID,"Iphone8", "Simple", 45000,"Samara", "Ya"));
//    }

    public List<Product> listProduct(String title){
//        return products;
        if (title != null) return productRepo.findByTitle(title);
        return productRepo.findAll();
    }

    public void saveProduct(Principal principal, Product product, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if(file1.getSize()!=0){
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }

        if(file2.getSize()!=0){
            image2 = toImageEntity(file2);
            product.addImageToProduct(image2);
        }

        if(file3.getSize()!=0){
            image3 = toImageEntity(file3);
            product.addImageToProduct(image3);
        }

        log.info("Saving new Product, Title: {} ; Author email: {}",product.getTitle(), product.getUser().getEmail());
        Product productFromDb = productRepo.save(product);
        productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        productRepo.save(product);
//        product.setId(++ID);
//        products.add(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepo.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProduct(Long id){
        productRepo.deleteById(id);
//        products.removeIf(product -> product.getId().equals(id));
    }

    public Product getProductById(Long id) {
        return productRepo.findById(id).orElse(null);
//        for (Product product : products){
//            if (product.getId().equals(id)) return product;
//        }
//        return null;
    }
}
