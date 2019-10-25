function [aeroForces] = paramSpace_2_1_3_1_2_1_2(sailStates,airStates)

	CL = (5.251136)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.032688)*sailStates.p + (44.579815)*sailStates.q + (-2.802490)*sailStates.r + (0.011856)*sailStates.de;
	CD = -1.045370;
	CY = (-0.028780)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.038442)*sailStates.p + (1.364608)*sailStates.q + (-0.220679)*sailStates.r + (0.000291)*sailStates.de;

	Cl = (2.048238)*sailStates.alpha + (0.465150)*sailStates.beta + (-1.573311)*sailStates.p + (15.162562)*sailStates.q + (-2.288258)*sailStates.r + (0.000915)*sailStates.de;
	Cm = (-12.262985)*sailStates.alpha + (0.000000)*sailStates.beta + (8.410574)*sailStates.p + (-146.890121)*sailStates.q + (9.240947)*sailStates.r + (-0.068730)*sailStates.de;
	Cn = (0.659283)*sailStates.alpha + (0.098871)*sailStates.beta + (2.043383)*sailStates.p + (-9.064035)*sailStates.q + (0.018942)*sailStates.r + (-0.000582)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end