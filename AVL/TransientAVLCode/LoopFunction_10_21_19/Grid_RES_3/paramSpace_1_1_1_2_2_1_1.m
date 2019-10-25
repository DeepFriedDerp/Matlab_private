function [aeroForces] = paramSpace_1_1_1_2_2_1_1(sailStates,airStates)

	CL = (4.415324)*sailStates.alpha + (-0.380616)*sailStates.beta + (-2.163186)*sailStates.p + (34.975311)*sailStates.q + (-1.765704)*sailStates.r + (0.010950)*sailStates.de;
	CD = -0.481820;
	CY = (0.074444)*sailStates.alpha + (-0.024090)*sailStates.beta + (-0.644025)*sailStates.p + (-0.267960)*sailStates.q + (-0.113533)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.227444)*sailStates.alpha + (0.231086)*sailStates.beta + (-0.910021)*sailStates.p + (8.141344)*sailStates.q + (-1.472373)*sailStates.r + (-0.000066)*sailStates.de;
	Cm = (-12.048425)*sailStates.alpha + (1.494974)*sailStates.beta + (6.381678)*sailStates.p + (-123.711861)*sailStates.q + (5.917492)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (-0.452824)*sailStates.alpha + (0.059891)*sailStates.beta + (1.328393)*sailStates.p + (-5.257087)*sailStates.q + (0.002620)*sailStates.r + (-0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end