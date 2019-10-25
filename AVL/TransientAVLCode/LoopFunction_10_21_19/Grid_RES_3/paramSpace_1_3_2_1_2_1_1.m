function [aeroForces] = paramSpace_1_3_2_1_2_1_1(sailStates,airStates)

	CL = (6.213994)*sailStates.alpha + (0.588937)*sailStates.beta + (-1.777925)*sailStates.p + (34.822395)*sailStates.q + (-2.813740)*sailStates.r + (0.011597)*sailStates.de;
	CD = -2.345820;
	CY = (0.344660)*sailStates.alpha + (-0.026316)*sailStates.beta + (-1.139184)*sailStates.p + (-0.589406)*sailStates.q + (-0.200869)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (1.233514)*sailStates.alpha + (0.742532)*sailStates.beta + (-0.467525)*sailStates.p + (4.424992)*sailStates.q + (-2.428921)*sailStates.r + (-0.000892)*sailStates.de;
	Cm = (-9.691789)*sailStates.alpha + (-2.243836)*sailStates.beta + (4.150180)*sailStates.p + (-110.634644)*sailStates.q + (9.359206)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (-2.088392)*sailStates.alpha + (0.096879)*sailStates.beta + (2.558657)*sailStates.p + (-11.115113)*sailStates.q + (0.037412)*sailStates.r + (-0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end