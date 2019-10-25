function [aeroForces] = paramSpace_1_3_1_2_2_1_1(sailStates,airStates)

	CL = (4.415324)*sailStates.alpha + (0.380616)*sailStates.beta + (-2.163186)*sailStates.p + (34.975311)*sailStates.q + (-1.765704)*sailStates.r + (0.010950)*sailStates.de;
	CD = -0.481820;
	CY = (0.074444)*sailStates.alpha + (-0.025572)*sailStates.beta + (-0.644025)*sailStates.p + (-0.267960)*sailStates.q + (-0.113533)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.097700)*sailStates.alpha + (0.426877)*sailStates.beta + (-0.825403)*sailStates.p + (7.080472)*sailStates.q + (-1.457352)*sailStates.r + (-0.000292)*sailStates.de;
	Cm = (-12.048425)*sailStates.alpha + (-1.494974)*sailStates.beta + (6.381680)*sailStates.p + (-123.711845)*sailStates.q + (5.917491)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (-0.555352)*sailStates.alpha + (0.056126)*sailStates.beta + (1.343313)*sailStates.p + (-5.444148)*sailStates.q + (0.005269)*sailStates.r + (-0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end