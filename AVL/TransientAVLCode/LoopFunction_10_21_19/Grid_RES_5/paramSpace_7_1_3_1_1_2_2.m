function [aeroForces] = paramSpace_7_1_3_1_1_2_2(sailStates,airStates)

	CL = (5.045138)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.076471)*sailStates.p + (38.251755)*sailStates.q + (1.326684)*sailStates.r + (0.011200)*sailStates.de;
	CD = -0.926160;
	CY = (0.041089)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.720968)*sailStates.p + (-0.910013)*sailStates.q + (0.025145)*sailStates.r + (-0.000199)*sailStates.de;

	Cl = (1.878533)*sailStates.alpha + (-0.323646)*sailStates.beta + (-1.629033)*sailStates.p + (13.426422)*sailStates.q + (1.268371)*sailStates.r + (0.001040)*sailStates.de;
	Cm = (-15.203709)*sailStates.alpha + (0.000000)*sailStates.beta + (10.744938)*sailStates.p + (-151.817017)*sailStates.q + (-4.510935)*sailStates.r + (-0.071941)*sailStates.de;
	Cn = (-0.194428)*sailStates.alpha + (-0.011302)*sailStates.beta + (-1.633564)*sailStates.p + (8.244646)*sailStates.q + (-0.010770)*sailStates.r + (0.000405)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end