function [aeroForces] = paramSpace_1_2_1_1_1_2_3(sailStates,airStates)

	CL = (3.310396)*sailStates.alpha + (-0.075190)*sailStates.beta + (-3.380051)*sailStates.p + (42.346699)*sailStates.q + (-0.917982)*sailStates.r + (0.010964)*sailStates.de;
	CD = 0.119090;
	CY = (-0.156235)*sailStates.alpha + (-0.023806)*sailStates.beta + (-0.084500)*sailStates.p + (-1.002333)*sailStates.q + (-0.016700)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.201961)*sailStates.alpha + (0.058028)*sailStates.beta + (-1.908321)*sailStates.p + (16.758871)*sailStates.q + (-0.647858)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-12.074597)*sailStates.alpha + (0.303038)*sailStates.beta + (11.476280)*sailStates.p + (-161.102386)*sailStates.q + (3.165241)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (0.494079)*sailStates.alpha + (0.012003)*sailStates.beta + (-0.138901)*sailStates.p + (2.955991)*sailStates.q + (-0.081437)*sailStates.r + (0.000309)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end