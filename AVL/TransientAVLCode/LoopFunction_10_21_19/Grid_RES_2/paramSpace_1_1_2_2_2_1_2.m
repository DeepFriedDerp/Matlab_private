function [aeroForces] = paramSpace_1_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.253658)*sailStates.alpha + (-0.176618)*sailStates.beta + (-2.757919)*sailStates.p + (38.024239)*sailStates.q + (-1.353480)*sailStates.r + (0.011245)*sailStates.de;
	CD = -0.164230;
	CY = (0.024726)*sailStates.alpha + (-0.025563)*sailStates.beta + (-0.469321)*sailStates.p + (0.513811)*sailStates.q + (-0.061751)*sailStates.r + (0.000110)*sailStates.de;

	Cl = (1.491409)*sailStates.alpha + (0.153172)*sailStates.beta + (-1.396521)*sailStates.p + (12.181371)*sailStates.q + (-1.069317)*sailStates.r + (0.000685)*sailStates.de;
	Cm = (-13.915562)*sailStates.alpha + (0.619058)*sailStates.beta + (8.883000)*sailStates.p + (-141.379639)*sailStates.q + (4.525610)*sailStates.r + (-0.069332)*sailStates.de;
	Cn = (0.112062)*sailStates.alpha + (0.028764)*sailStates.beta + (0.894638)*sailStates.p + (-3.912528)*sailStates.q + (0.001040)*sailStates.r + (-0.000239)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end