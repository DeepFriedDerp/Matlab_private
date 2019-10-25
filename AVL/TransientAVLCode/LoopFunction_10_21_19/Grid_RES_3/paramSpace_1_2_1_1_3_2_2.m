function [aeroForces] = paramSpace_1_2_1_1_3_2_2(sailStates,airStates)

	CL = (4.172783)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.457823)*sailStates.p + (35.545292)*sailStates.q + (-1.321680)*sailStates.r + (0.010637)*sailStates.de;
	CD = -0.019700;
	CY = (0.220732)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.484402)*sailStates.p + (1.671348)*sailStates.q + (-0.085572)*sailStates.r + (0.000355)*sailStates.de;

	Cl = (1.480709)*sailStates.alpha + (0.175545)*sailStates.beta + (-1.146832)*sailStates.p + (9.968260)*sailStates.q + (-0.988380)*sailStates.r + (0.000236)*sailStates.de;
	Cm = (-13.977853)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.795521)*sailStates.p + (-133.415192)*sailStates.q + (4.429143)*sailStates.r + (-0.068163)*sailStates.de;
	Cn = (-0.184802)*sailStates.alpha + (0.030953)*sailStates.beta + (0.861994)*sailStates.p + (-4.415045)*sailStates.q + (0.013396)*sailStates.r + (-0.000527)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end