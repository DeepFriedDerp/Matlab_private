function [aeroForces] = paramSpace_2_4_1_2_3_3_2(sailStates,airStates)

	CL = (4.218380)*sailStates.alpha + (-0.106407)*sailStates.beta + (-2.512694)*sailStates.p + (33.562374)*sailStates.q + (0.464268)*sailStates.r + (0.010586)*sailStates.de;
	CD = -0.282550;
	CY = (0.093631)*sailStates.alpha + (-0.023721)*sailStates.beta + (0.255136)*sailStates.p + (0.769436)*sailStates.q + (0.016641)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.146256)*sailStates.alpha + (-0.188497)*sailStates.beta + (-1.136671)*sailStates.p + (8.803562)*sailStates.q + (0.520654)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.603903)*sailStates.alpha + (0.372932)*sailStates.beta + (8.820923)*sailStates.p + (-135.788696)*sailStates.q + (-1.552726)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.118227)*sailStates.alpha + (-0.009723)*sailStates.beta + (-0.678126)*sailStates.p + (2.849664)*sailStates.q + (-0.005547)*sailStates.r + (-0.000143)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end