function [aeroForces] = paramSpace_1_2_1_1_2_3_1(sailStates,airStates)

	CL = (5.349017)*sailStates.alpha + (0.111972)*sailStates.beta + (-1.457325)*sailStates.p + (20.157167)*sailStates.q + (1.598267)*sailStates.r + (0.008572)*sailStates.de;
	CD = -2.002420;
	CY = (-0.407876)*sailStates.alpha + (-0.024203)*sailStates.beta + (0.894199)*sailStates.p + (-0.662190)*sailStates.q + (0.177938)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (1.045130)*sailStates.alpha + (-0.381809)*sailStates.beta + (-0.425135)*sailStates.p + (1.277418)*sailStates.q + (1.654668)*sailStates.r + (-0.000734)*sailStates.de;
	Cm = (-16.086357)*sailStates.alpha + (-0.407674)*sailStates.beta + (6.879846)*sailStates.p + (-110.966957)*sailStates.q + (-5.168254)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (1.952182)*sailStates.alpha + (-0.087757)*sailStates.beta + (-2.091061)*sailStates.p + (10.043451)*sailStates.q + (-0.070249)*sailStates.r + (0.000346)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end