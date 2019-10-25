function [aeroForces] = paramSpace_4_1_4_3_1_1_3(sailStates,airStates)

	CL = (3.768587)*sailStates.alpha + (0.112345)*sailStates.beta + (-2.646478)*sailStates.p + (34.974495)*sailStates.q + (0.556738)*sailStates.r + (0.010005)*sailStates.de;
	CD = 0.007500;
	CY = (-0.078272)*sailStates.alpha + (-0.027177)*sailStates.beta + (0.047306)*sailStates.p + (-0.684401)*sailStates.q + (-0.009483)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.337894)*sailStates.alpha + (0.044865)*sailStates.beta + (-1.381849)*sailStates.p + (11.820886)*sailStates.q + (0.289057)*sailStates.r + (0.000753)*sailStates.de;
	Cm = (-13.845528)*sailStates.alpha + (-0.450962)*sailStates.beta + (9.168469)*sailStates.p + (-140.146637)*sailStates.q + (-1.931174)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (-0.162895)*sailStates.alpha + (-0.005359)*sailStates.beta + (0.172400)*sailStates.p + (-1.352521)*sailStates.q + (-0.037248)*sailStates.r + (0.000160)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end