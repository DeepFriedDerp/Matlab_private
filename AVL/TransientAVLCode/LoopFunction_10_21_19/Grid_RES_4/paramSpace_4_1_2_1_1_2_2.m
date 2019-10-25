function [aeroForces] = paramSpace_4_1_2_1_1_2_2(sailStates,airStates)

	CL = (4.149402)*sailStates.alpha + (0.253227)*sailStates.beta + (-2.412503)*sailStates.p + (35.263653)*sailStates.q + (1.400838)*sailStates.r + (0.010508)*sailStates.de;
	CD = -0.040330;
	CY = (-0.219903)*sailStates.alpha + (-0.029911)*sailStates.beta + (0.477345)*sailStates.p + (-1.664520)*sailStates.q + (-0.094890)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (1.519176)*sailStates.alpha + (-0.078507)*sailStates.beta + (-1.171031)*sailStates.p + (10.510977)*sailStates.q + (1.019692)*sailStates.r + (0.000343)*sailStates.de;
	Cm = (-13.828918)*sailStates.alpha + (-0.864784)*sailStates.beta + (7.544069)*sailStates.p + (-131.445847)*sailStates.q + (-4.641081)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.139902)*sailStates.alpha + (0.037717)*sailStates.beta + (-0.843961)*sailStates.p + (4.339266)*sailStates.q + (0.011254)*sailStates.r + (0.000537)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end