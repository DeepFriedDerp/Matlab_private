function [aeroForces] = paramSpace_4_2_2_1_3_3_3(sailStates,airStates)

	CL = (5.078396)*sailStates.alpha + (0.235756)*sailStates.beta + (-3.551986)*sailStates.p + (50.179932)*sailStates.q + (3.150182)*sailStates.r + (0.012741)*sailStates.de;
	CD = -1.862340;
	CY = (0.560106)*sailStates.alpha + (-0.023945)*sailStates.beta + (1.087061)*sailStates.p + (1.002333)*sailStates.q + (-0.216266)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (1.159611)*sailStates.alpha + (-0.511017)*sailStates.beta + (-1.962965)*sailStates.p + (18.848747)*sailStates.q + (2.687786)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-8.642097)*sailStates.alpha + (-0.880311)*sailStates.beta + (10.026878)*sailStates.p + (-161.102386)*sailStates.q + (-10.451870)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-1.850497)*sailStates.alpha + (0.115388)*sailStates.beta + (-2.164773)*sailStates.p + (7.550520)*sailStates.q + (-0.026316)*sailStates.r + (-0.000042)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end