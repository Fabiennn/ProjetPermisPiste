package com.epul.oeuvre.utilitaires;

import com.epul.oeuvre.domains.ActionEntity;
import com.epul.oeuvre.domains.IndicatorEntity;

import javax.swing.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

public class FonctionsUtiles {


	public static int simulerAction(ActionEntity action){
		List<IndicatorEntity> indicators = (List<IndicatorEntity>) action.getIndicatorsById();
		int score = 0;
		Random random = new Random();
		for(IndicatorEntity indicator : indicators){
			int bonneReponse;
			int mauvaiseReponse;
			if(indicator.getValueIfCheck()>0){
				bonneReponse = indicator.getValueIfCheck();
				mauvaiseReponse = indicator.getValueIfUnCheck();
			}else{
				bonneReponse = indicator.getValueIfUnCheck();
				mauvaiseReponse = indicator.getValueIfCheck();
			}
			score += random.nextGaussian()>-0.7 ? bonneReponse : mauvaiseReponse; // 70% de chance de choisir la bonne réponse
		}
		return score;
	}
}