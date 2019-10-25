function [aeroForces] = paramSpace_1_2_1_1_2_3_3(sailStates,airStates)

	CL = (5.274552)*sailStates.alpha + (0.080061)*sailStates.beta + (-3.161048)*sailStates.p + (34.688641)*sailStates.q + (0.908505)*sailStates.r + (0.009357)*sailStates.de;
	CD = -1.840600;
	CY = (0.330650)*sailStates.alpha + (-0.025749)*sailStates.beta + (0.683086)*sailStates.p + (0.662188)*sailStates.q + (0.135803)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.777342)*sailStates.alpha + (-0.351663)*sailStates.beta + (-1.823976)*sailStates.p + (14.751375)*sailStates.q + (1.090931)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-14.759364)*sailStates.alpha + (-0.299473)*sailStates.beta + (12.379090)*sailStates.p + (-158.727341)*sailStates.q + (-2.862941)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-0.595520)*sailStates.alpha + (-0.078132)*sailStates.beta + (-1.929162)*sailStates.p + (9.697124)*sailStates.q + (-0.094644)*sailStates.r + (0.000018)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end