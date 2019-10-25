function [aeroForces] = paramSpace_4_2_3_1_3_2_3(sailStates,airStates)

	CL = (3.359677)*sailStates.alpha + (0.068249)*sailStates.beta + (-3.380998)*sailStates.p + (42.297268)*sailStates.q + (0.908176)*sailStates.r + (0.011055)*sailStates.de;
	CD = 0.099040;
	CY = (0.150641)*sailStates.alpha + (-0.023875)*sailStates.beta + (0.069770)*sailStates.p + (1.002334)*sailStates.q + (-0.013842)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (1.213475)*sailStates.alpha + (-0.051283)*sailStates.beta + (-1.908752)*sailStates.p + (16.756691)*sailStates.q + (0.623585)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-12.286872)*sailStates.alpha + (-0.257850)*sailStates.beta + (11.487852)*sailStates.p + (-161.102386)*sailStates.q + (-3.107061)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-0.476794)*sailStates.alpha + (0.010761)*sailStates.beta + (0.161165)*sailStates.p + (-2.966960)*sailStates.q + (-0.080657)*sailStates.r + (-0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end