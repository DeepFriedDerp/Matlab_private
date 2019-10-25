function [aeroForces] = paramSpace_1_1_2_3_3_3_3(sailStates,airStates)

	CL = (3.820951)*sailStates.alpha + (-0.092244)*sailStates.beta + (-2.647213)*sailStates.p + (34.926060)*sailStates.q + (-0.548134)*sailStates.r + (0.010093)*sailStates.de;
	CD = -0.018780;
	CY = (0.079880)*sailStates.alpha + (-0.027035)*sailStates.beta + (-0.032901)*sailStates.p + (0.684401)*sailStates.q + (-0.006569)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.337791)*sailStates.alpha + (-0.050930)*sailStates.beta + (-1.382221)*sailStates.p + (11.818688)*sailStates.q + (-0.265528)*sailStates.r + (0.000753)*sailStates.de;
	Cm = (-14.041540)*sailStates.alpha + (0.318703)*sailStates.beta + (9.178564)*sailStates.p + (-140.146637)*sailStates.q + (1.880422)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (0.156042)*sailStates.alpha + (-0.006754)*sailStates.beta + (-0.194160)*sailStates.p + (1.363570)*sailStates.q + (-0.036730)*sailStates.r + (-0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end