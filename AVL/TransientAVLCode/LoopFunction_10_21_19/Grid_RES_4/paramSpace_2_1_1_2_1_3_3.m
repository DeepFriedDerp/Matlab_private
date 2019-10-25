function [aeroForces] = paramSpace_2_1_1_2_1_3_3(sailStates,airStates)

	CL = (4.479047)*sailStates.alpha + (0.154601)*sailStates.beta + (-2.930323)*sailStates.p + (36.736206)*sailStates.q + (0.812438)*sailStates.r + (0.010786)*sailStates.de;
	CD = -0.495440;
	CY = (0.001169)*sailStates.alpha + (-0.023861)*sailStates.beta + (0.487431)*sailStates.p + (-0.668510)*sailStates.q + (0.032018)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.682945)*sailStates.alpha + (-0.164849)*sailStates.beta + (-1.572536)*sailStates.p + (13.034098)*sailStates.q + (0.798817)*sailStates.r + (0.001017)*sailStates.de;
	Cm = (-14.813128)*sailStates.alpha + (-0.536757)*sailStates.beta + (10.339851)*sailStates.p + (-147.557632)*sailStates.q + (-2.711474)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.004321)*sailStates.alpha + (-0.017788)*sailStates.beta + (-1.183234)*sailStates.p + (6.357528)*sailStates.q + (-0.018779)*sailStates.r + (0.000317)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end