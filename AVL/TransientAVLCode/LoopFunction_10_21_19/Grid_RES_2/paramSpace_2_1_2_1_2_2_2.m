function [aeroForces] = paramSpace_2_1_2_1_2_2_2(sailStates,airStates)

	CL = (4.375302)*sailStates.alpha + (0.295753)*sailStates.beta + (-3.114954)*sailStates.p + (42.129452)*sailStates.q + (1.840713)*sailStates.r + (0.011640)*sailStates.de;
	CD = -0.617880;
	CY = (0.234548)*sailStates.alpha + (-0.023788)*sailStates.beta + (0.651192)*sailStates.p + (0.715008)*sailStates.q + (-0.085680)*sailStates.r + (0.000154)*sailStates.de;

	Cl = (1.347763)*sailStates.alpha + (-0.269382)*sailStates.beta + (-1.664369)*sailStates.p + (14.855597)*sailStates.q + (1.586355)*sailStates.r + (0.001138)*sailStates.de;
	Cm = (-12.155688)*sailStates.alpha + (-1.165268)*sailStates.beta + (9.817899)*sailStates.p + (-150.764221)*sailStates.q + (-6.220822)*sailStates.r + (-0.070345)*sailStates.de;
	Cn = (-0.662084)*sailStates.alpha + (0.045783)*sailStates.beta + (-1.286466)*sailStates.p + (4.433219)*sailStates.q + (-0.010869)*sailStates.r + (-0.000092)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end