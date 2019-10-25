function [aeroForces] = paramSpace_3_1_1_3_1_3_1(sailStates,airStates)

	CL = (4.322791)*sailStates.alpha + (0.202388)*sailStates.beta + (-2.299236)*sailStates.p + (33.378277)*sailStates.q + (1.066995)*sailStates.r + (0.010951)*sailStates.de;
	CD = -0.230780;
	CY = (-0.101498)*sailStates.alpha + (-0.025111)*sailStates.beta + (0.431169)*sailStates.p + (-0.432841)*sailStates.q + (-0.028215)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.335100)*sailStates.alpha + (-0.127202)*sailStates.beta + (-1.037547)*sailStates.p + (8.557440)*sailStates.q + (0.883662)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-14.326449)*sailStates.alpha + (-0.690024)*sailStates.beta + (7.623763)*sailStates.p + (-128.769608)*sailStates.q + (-3.582165)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.318229)*sailStates.alpha + (0.013942)*sailStates.beta + (-0.915060)*sailStates.p + (4.420164)*sailStates.q + (0.006200)*sailStates.r + (0.000209)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end