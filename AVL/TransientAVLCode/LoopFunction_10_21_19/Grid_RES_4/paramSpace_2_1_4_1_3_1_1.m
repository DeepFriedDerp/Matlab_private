function [aeroForces] = paramSpace_2_1_4_1_3_1_1(sailStates,airStates)

	CL = (7.236919)*sailStates.alpha + (-0.600574)*sailStates.beta + (-1.703608)*sailStates.p + (30.263487)*sailStates.q + (-2.868259)*sailStates.r + (0.011050)*sailStates.de;
	CD = -2.909460;
	CY = (0.688766)*sailStates.alpha + (-0.025890)*sailStates.beta + (-1.341016)*sailStates.p + (1.471504)*sailStates.q + (-0.087740)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (2.272032)*sailStates.alpha + (0.420325)*sailStates.beta + (-0.532860)*sailStates.p + (4.340506)*sailStates.q + (-2.541157)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.914818)*sailStates.alpha + (2.237991)*sailStates.beta + (5.052542)*sailStates.p + (-111.058342)*sailStates.q + (9.679743)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-2.536231)*sailStates.alpha + (0.044290)*sailStates.beta + (2.959115)*sailStates.p + (-14.628476)*sailStates.q + (0.029284)*sailStates.r + (-0.000624)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end