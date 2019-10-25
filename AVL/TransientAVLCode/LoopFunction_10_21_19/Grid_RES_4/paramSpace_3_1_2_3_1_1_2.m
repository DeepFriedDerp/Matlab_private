function [aeroForces] = paramSpace_3_1_2_3_1_1_2(sailStates,airStates)

	CL = (4.110032)*sailStates.alpha + (-0.075667)*sailStates.beta + (-2.525208)*sailStates.p + (33.941277)*sailStates.q + (-0.195730)*sailStates.r + (0.010731)*sailStates.de;
	CD = -0.114090;
	CY = (-0.061053)*sailStates.alpha + (-0.025265)*sailStates.beta + (-0.160184)*sailStates.p + (-0.498142)*sailStates.q + (0.010517)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.303763)*sailStates.alpha + (0.086919)*sailStates.beta + (-1.239248)*sailStates.p + (10.118561)*sailStates.q + (-0.285969)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.702421)*sailStates.alpha + (0.352687)*sailStates.beta + (8.779406)*sailStates.p + (-135.916275)*sailStates.q + (0.680667)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.068773)*sailStates.alpha + (-0.007245)*sailStates.beta + (0.440100)*sailStates.p + (-1.841866)*sailStates.q + (-0.004846)*sailStates.r + (0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end