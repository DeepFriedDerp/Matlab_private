function [aeroForces] = paramSpace_1_2_1_3_2_3_3(sailStates,airStates)

	CL = (3.835175)*sailStates.alpha + (-0.032322)*sailStates.beta + (-2.679784)*sailStates.p + (35.162968)*sailStates.q + (-0.439054)*sailStates.r + (0.010165)*sailStates.de;
	CD = -0.019440;
	CY = (0.026841)*sailStates.alpha + (-0.025204)*sailStates.beta + (0.028626)*sailStates.p + (0.194782)*sailStates.q + (0.005673)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.316383)*sailStates.alpha + (-0.032824)*sailStates.beta + (-1.368276)*sailStates.p + (11.475339)*sailStates.q + (-0.185321)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-14.109887)*sailStates.alpha + (0.133933)*sailStates.beta + (9.398136)*sailStates.p + (-141.871536)*sailStates.q + (1.552554)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (0.211287)*sailStates.alpha + (-0.006658)*sailStates.beta + (-0.327666)*sailStates.p + (2.382589)*sailStates.q + (-0.048116)*sailStates.r + (-0.000009)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end