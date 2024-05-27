package com.oneempower.auth.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oneempower.auth.model.ImageGallery;
import com.oneempower.auth.model.SinhVien;
import com.oneempower.auth.repository.ImageGalleryRepository;



@Service
public class ImageGalleryService {

	@Autowired
	private ImageGalleryRepository imageGalleryRepository;
	
	public void saveImage(ImageGallery imageGallery) {
		imageGalleryRepository.save(imageGallery);	
	}

	public List<ImageGallery> getAllActiveImages() {
		return imageGalleryRepository.findAll();
	}

	public Optional<ImageGallery> getImageById(Long id) {
		return imageGalleryRepository.findById(id);
	}

	public ImageGallery update(ImageGallery imageGallery) {
		// TODO Auto-generated method stub
		ImageGallery imageGallery2 = imageGalleryRepository.findById(imageGallery.getId()).orElse(null);
		imageGallery.setName(imageGallery.getName());
		imageGallery.setDescription(imageGallery.getDescription());
		imageGallery.setImage(imageGallery.getImage());
		imageGallery.setPrice(imageGallery.getPrice());
		return imageGalleryRepository.save(imageGallery);
	}

	public Object findById(Long id) {
		// TODO Auto-generated method stub
		return imageGalleryRepository.findById(id).orElse(null);
	}

	public boolean delete(Long id) {
		Optional<ImageGallery> imageGallery = imageGalleryRepository.findById(id);
		if (imageGallery.isPresent()) {
			imageGalleryRepository.deleteById(id);
			return true;
		}
		
		return false;
		// TODO Auto-generated method stub
		
	}
}

