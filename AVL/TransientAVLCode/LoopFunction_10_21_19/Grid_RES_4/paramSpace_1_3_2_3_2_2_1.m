function [aeroForces] = paramSpace_1_3_2_3_2_2_1(sailStates,airStates)

	CL = (3.837196)*sailStates.alpha + (0.067575)*sailStates.beta + (-2.229151)*sailStates.p + (33.169403)*sailStates.q + (-0.889579)*sailStates.r + (0.010471)*sailStates.de;
	CD = 0.069720;
	CY = (-0.002525)*sailStates.alpha + (-0.025190)*sailStates.beta + (-0.197930)*sailStates.p + (-0.194782)*sailStates.q + (-0.039364)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.044725)*sailStates.alpha + (0.124555)*sailStates.beta + (-0.941381)*sailStates.p + (7.727749)*sailStates.q + (-0.603263)*sailStates.r + (-0.000040)*sailStates.de;
	Cm = (-13.538568)*sailStates.alpha + (-0.254062)*sailStates.beta + (7.357349)*sailStates.p + (-127.822792)*sailStates.q + (3.001943)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (0.017085)*sailStates.alpha + (0.022082)*sailStates.beta + (0.298785)*sailStates.p + (-0.674944)*sailStates.q + (-0.023355)*sailStates.r + (0.000040)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end