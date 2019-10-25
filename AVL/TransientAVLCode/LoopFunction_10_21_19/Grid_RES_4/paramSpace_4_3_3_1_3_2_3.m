function [aeroForces] = paramSpace_4_3_3_1_3_2_3(sailStates,airStates)

	CL = (3.359676)*sailStates.alpha + (-0.068249)*sailStates.beta + (-3.380999)*sailStates.p + (42.297268)*sailStates.q + (0.908176)*sailStates.r + (0.011055)*sailStates.de;
	CD = 0.099040;
	CY = (0.150641)*sailStates.alpha + (-0.026077)*sailStates.beta + (0.069770)*sailStates.p + (1.002334)*sailStates.q + (-0.013842)*sailStates.r + (0.000216)*sailStates.de;

	Cl = (1.178907)*sailStates.alpha + (-0.097541)*sailStates.beta + (-1.877214)*sailStates.p + (16.359728)*sailStates.q + (0.617297)*sailStates.r + (0.001550)*sailStates.de;
	Cm = (-12.286872)*sailStates.alpha + (0.257850)*sailStates.beta + (11.487852)*sailStates.p + (-161.102386)*sailStates.q + (-3.107061)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-0.463143)*sailStates.alpha + (0.018842)*sailStates.beta + (0.154891)*sailStates.p + (-2.888000)*sailStates.q + (-0.079407)*sailStates.r + (-0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end