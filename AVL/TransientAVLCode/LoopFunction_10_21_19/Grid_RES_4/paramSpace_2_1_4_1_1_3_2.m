function [aeroForces] = paramSpace_2_1_4_1_1_3_2(sailStates,airStates)

	CL = (7.271598)*sailStates.alpha + (0.542248)*sailStates.beta + (-2.506554)*sailStates.p + (31.925465)*sailStates.q + (2.346432)*sailStates.r + (0.010390)*sailStates.de;
	CD = -2.855040;
	CY = (-0.194453)*sailStates.alpha + (-0.023516)*sailStates.beta + (1.271054)*sailStates.p + (-1.693496)*sailStates.q + (0.083131)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (2.763348)*sailStates.alpha + (-0.409206)*sailStates.beta + (-1.240147)*sailStates.p + (9.583606)*sailStates.q + (2.246002)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-17.243614)*sailStates.alpha + (-2.195636)*sailStates.beta + (9.383025)*sailStates.p + (-136.946671)*sailStates.q + (-7.962561)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (0.685686)*sailStates.alpha + (-0.042067)*sailStates.beta + (-2.855018)*sailStates.p + (14.340702)*sailStates.q + (-0.034702)*sailStates.r + (0.000703)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end