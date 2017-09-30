clc;
clear;
close all;

near_focussed=double(imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\new_temple_n.bmp'));
far_focussed=double(imread('C:\Users\Kevin Joseph\Documents\MATLAB\Depth Estimation\new_temple_f.bmp'));

near_focussed_f=fft2(near_focussed);
far_focussed_f=fft2(far_focussed);

m_by_p_ratio=abs((far_focussed_f-near_focussed_f)/(far_focussed_f+near_focussed_f));
% m_by_p_ratio=((near_focussed-far_focussed)/(far_focussed+near_focussed));

m_by_p_ratio = fftshift(m_by_p_ratio);
m_by_p_ratio=medfilt2(m_by_p_ratio);
surf(m_by_p_ratio);