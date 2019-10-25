function [aeroForces] = paramSpace_9_1_2_1_2_2_2(sailStates,airStates)

	CL = (4.465065)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.112212)*sailStates.p + (39.888443)*sailStates.q + (1.233168)*sailStates.r + (0.011534)*sailStates.de;
	CD = -0.581350;
	CY = (0.219313)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.491987)*sailStates.p + (0.910010)*sailStates.q + (-0.017213)*sailStates.r + (0.000199)*sailStates.de;

	Cl = (1.370389)*sailStates.alpha + (-0.282832)*sailStates.beta + (-1.640339)*sailStates.p + (13.858543)*sailStates.q + (1.128666)*sailStates.r + (0.001040)*sailStates.de;
	Cm = (-13.721662)*sailStates.alpha + (0.000000)*sailStates.beta + (10.441096)*sailStates.p + (-151.817017)*sailStates.q + (-4.189948)*sailStates.r + (-0.071941)*sailStates.de;
	Cn = (-0.420559)*sailStates.alpha + (0.009877)*sailStates.beta + (-1.086836)*sailStates.p + (4.129656)*sailStates.q + (0.000573)*sailStates.r + (-0.000149)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end