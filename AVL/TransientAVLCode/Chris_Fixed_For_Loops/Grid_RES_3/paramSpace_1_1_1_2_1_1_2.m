function [aeroForces] = paramSpace_1_1_1_2_1_1_2(sailStates,airStates)

	CL = (0.443286)*sailStates.alpha + (0.097824)*sailStates.beta + (-6.019735)*sailStates.p + (58.104778)*sailStates.q + (0.370772)*sailStates.r + (0.011217)*sailStates.de;
	CD = -2.406340;
	CY = (1.238669)*sailStates.alpha + (-0.029160)*sailStates.beta + (0.551190)*sailStates.p + (3.032506)*sailStates.q + (0.096901)*sailStates.r + (0.000689)*sailStates.de;

	Cl = (-1.453378)*sailStates.alpha + (-0.405149)*sailStates.beta + (-4.176878)*sailStates.p + (37.022705)*sailStates.q + (0.696363)*sailStates.r + (0.005625)*sailStates.de;
	Cm = (5.247532)*sailStates.alpha + (-0.402695)*sailStates.beta + (21.831516)*sailStates.p + (-238.428818)*sailStates.q + (-1.107184)*sailStates.r + (-0.082319)*sailStates.de;
	Cn = (-4.766815)*sailStates.alpha + (-0.077126)*sailStates.beta + (-2.073748)*sailStates.p + (10.450191)*sailStates.q + (-0.112723)*sailStates.r + (-0.000572)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end