function [aeroForces] = paramSpace_2_2_4_2_3_3_1(sailStates,airStates)

	CL = (4.291398)*sailStates.alpha + (0.059187)*sailStates.beta + (-2.130690)*sailStates.p + (30.520512)*sailStates.q + (0.539549)*sailStates.r + (0.010656)*sailStates.de;
	CD = -0.336450;
	CY = (0.029216)*sailStates.alpha + (-0.025144)*sailStates.beta + (0.315440)*sailStates.p + (0.668510)*sailStates.q + (0.020746)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.023622)*sailStates.alpha + (-0.172462)*sailStates.beta + (-0.882822)*sailStates.p + (6.633118)*sailStates.q + (0.628787)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.864491)*sailStates.alpha + (-0.268738)*sailStates.beta + (7.554382)*sailStates.p + (-125.787453)*sailStates.q + (-1.865758)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (0.325877)*sailStates.alpha + (-0.012434)*sailStates.beta + (-0.759376)*sailStates.p + (2.962397)*sailStates.q + (-0.005191)*sailStates.r + (-0.000143)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end