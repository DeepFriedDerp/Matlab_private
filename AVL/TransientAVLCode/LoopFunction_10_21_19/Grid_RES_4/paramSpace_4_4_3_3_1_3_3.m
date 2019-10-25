function [aeroForces] = paramSpace_4_4_3_3_1_3_3(sailStates,airStates)

	CL = (4.231403)*sailStates.alpha + (-0.399457)*sailStates.beta + (-2.747031)*sailStates.p + (39.584599)*sailStates.q + (1.870847)*sailStates.r + (0.011012)*sailStates.de;
	CD = -0.251930;
	CY = (-0.021149)*sailStates.alpha + (-0.022537)*sailStates.beta + (0.639008)*sailStates.p + (-0.684403)*sailStates.q + (-0.127131)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.440608)*sailStates.alpha + (-0.412411)*sailStates.beta + (-1.319430)*sailStates.p + (11.860757)*sailStates.q + (1.473299)*sailStates.r + (0.000497)*sailStates.de;
	Cm = (-12.595708)*sailStates.alpha + (1.492052)*sailStates.beta + (8.313735)*sailStates.p + (-140.146637)*sailStates.q + (-6.228213)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (-0.155664)*sailStates.alpha + (0.055535)*sailStates.beta + (-1.203694)*sailStates.p + (5.056093)*sailStates.q + (-0.001424)*sailStates.r + (0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end