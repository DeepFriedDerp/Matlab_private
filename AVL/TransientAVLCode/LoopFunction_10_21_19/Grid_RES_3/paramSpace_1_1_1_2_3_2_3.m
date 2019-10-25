function [aeroForces] = paramSpace_1_1_1_2_3_2_3(sailStates,airStates)

	CL = (3.859076)*sailStates.alpha + (-0.228138)*sailStates.beta + (-2.855692)*sailStates.p + (38.465691)*sailStates.q + (-1.221048)*sailStates.r + (0.010692)*sailStates.de;
	CD = 0.052570;
	CY = (0.067536)*sailStates.alpha + (-0.027673)*sailStates.beta + (-0.380336)*sailStates.p + (1.027327)*sailStates.q + (-0.067161)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.476609)*sailStates.alpha + (0.072075)*sailStates.beta + (-1.516610)*sailStates.p + (13.449028)*sailStates.q + (-0.913552)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-13.392765)*sailStates.alpha + (0.881806)*sailStates.beta + (9.288920)*sailStates.p + (-144.553253)*sailStates.q + (4.113842)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.228611)*sailStates.alpha + (0.026080)*sailStates.beta + (0.580040)*sailStates.p + (-2.319138)*sailStates.q + (-0.011724)*sailStates.r + (-0.000326)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end