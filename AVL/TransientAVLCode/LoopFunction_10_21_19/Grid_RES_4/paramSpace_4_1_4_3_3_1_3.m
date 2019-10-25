function [aeroForces] = paramSpace_4_1_4_3_3_1_3(sailStates,airStates)

	CL = (3.811784)*sailStates.alpha + (0.077494)*sailStates.beta + (-2.675354)*sailStates.p + (34.813271)*sailStates.q + (0.306163)*sailStates.r + (0.010011)*sailStates.de;
	CD = -0.059490;
	CY = (0.022883)*sailStates.alpha + (-0.023756)*sailStates.beta + (-0.108261)*sailStates.p + (0.294836)*sailStates.q + (0.021566)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.366810)*sailStates.alpha + (0.067080)*sailStates.beta + (-1.399832)*sailStates.p + (11.769862)*sailStates.q + (0.083322)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-13.998748)*sailStates.alpha + (-0.336292)*sailStates.beta + (9.503646)*sailStates.p + (-141.543869)*sailStates.q + (-1.122374)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (-0.264640)*sailStates.alpha + (-0.017826)*sailStates.beta + (0.500623)*sailStates.p + (-3.580599)*sailStates.q + (-0.061059)*sailStates.r + (-0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end