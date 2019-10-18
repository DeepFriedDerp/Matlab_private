%function [time,points] = MariaFunction(

clear all;

totalRunTime = 10;         %seconds
finalStepSize = 0.008;     %seconds
sineFreq = 1500;           %cycles per second
sineAmplitude = 1;         %scalar


sineOmega = 1500 * (2*pi()); % radians per second
accLimit = sineAmplitude * sineOmega * sineOmega;
jerkLimit = sineAmplitude * sineOmega * sineOmega * sineOmega;


imax = (totalRunTime / finalStepSize) + (2*pi() / finalStepSize);
sineOmega = 1500 * (2*pi()); % radians per second

for i = 1:imax
    t(i) = (i * finalStepSize) - (pi());
    if t(i) < 0 || t(i) > totalRunTime
        pos(i) = 0;
    else
        pos(i) = sineAmplitude * sin(sineOmega * t(i));
    end
end


[vt,vel] = discreteDeriv(t,pos);
[at,acc] = discreteDeriv(vt,vel);
[jt,jrk] = discreteDeriv(at,acc);


jrk = limitData(jrk,jerkLimit);
acc = limitData(acc,accLimit);



[iat_j,iacc_j] = discreteInt(jt,jrk);
[ivt_j,ivel_j] = discreteInt(iat_j,iacc_j);
[ipt_j,ipos_j] = discreteInt(ivt_j,ivel_j);

[ivt_a,ivel_a] = discreteInt(at,acc);
[ipt_a,ipos_a] = discreteInt(ivt_a,ivel_a);


if max(abs(iacc_j)) > accLimit
    answerTime = ipt_a;
    ansswerPos = ipos_a;
else
    answerTime = ipt_j;
    ansswerPos = ipos_j;
end
