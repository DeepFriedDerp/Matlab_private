function [aeroForces] = paramSpace_3_1_2_3_2_1_1(sailStates,airStates)

	CL = (4.142737)*sailStates.alpha + (-0.098336)*sailStates.beta + (-2.269974)*sailStates.p + (31.805399)*sailStates.q + (-0.359805)*sailStates.r + (0.010611)*sailStates.de;
	CD = -0.156290;
	CY = (0.035111)*sailStates.alpha + (-0.024723)*sailStates.beta + (-0.251245)*sailStates.p + (0.065300)*sailStates.q + (0.016465)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.218199)*sailStates.alpha + (0.097943)*sailStates.beta + (-1.029780)*sailStates.p + (8.137163)*sailStates.q + (-0.420042)*sailStates.r + (0.000129)*sailStates.de;
	Cm = (-14.757948)*sailStates.alpha + (0.429784)*sailStates.beta + (7.967764)*sailStates.p + (-129.003830)*sailStates.q + (1.228167)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.262430)*sailStates.alpha + (-0.009318)*sailStates.beta + (0.613155)*sailStates.p + (-2.977833)*sailStates.q + (-0.008271)*sailStates.r + (-0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end