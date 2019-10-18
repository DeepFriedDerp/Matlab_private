function [aeroForces] = paramSpace_1_2_1_2_1_1_1(sailStates,airStates)

	CL = (6.886552)*sailStates.alpha + (-0.446796)*sailStates.beta + (-2.563097)*sailStates.p + (30.079844)*sailStates.q + (0.259316)*sailStates.r + (0.008950)*sailStates.de;
	CD = -3.773600;
	CY = (1.643098)*sailStates.alpha + (-0.001860)*sailStates.beta + (-0.195812)*sailStates.p + (13.411588)*sailStates.q + (-0.023879)*sailStates.r + (0.002856)*sailStates.de;

	Cl = (-1.126213)*sailStates.alpha + (-0.452597)*sailStates.beta + (-1.339506)*sailStates.p + (10.969290)*sailStates.q + (0.847261)*sailStates.r + (0.000324)*sailStates.de;
	Cm = (-13.433198)*sailStates.alpha + (2.136660)*sailStates.beta + (9.213503)*sailStates.p + (-137.775543)*sailStates.q + (-1.074495)*sailStates.r + (-0.068370)*sailStates.de;
	Cn = (-1.641803)*sailStates.alpha + (-0.072938)*sailStates.beta + (-0.112982)*sailStates.p + (-9.030433)*sailStates.q + (0.116301)*sailStates.r + (-0.003789)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end