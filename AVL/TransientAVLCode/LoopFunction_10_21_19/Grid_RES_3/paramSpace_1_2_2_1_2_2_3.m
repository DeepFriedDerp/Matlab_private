function [aeroForces] = paramSpace_1_2_2_1_2_2_3(sailStates,airStates)

	CL = (3.575234)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.362500)*sailStates.p + (42.484318)*sailStates.q + (-1.186544)*sailStates.r + (0.011204)*sailStates.de;
	CD = 0.075930;
	CY = (-0.034402)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.292361)*sailStates.p + (0.589407)*sailStates.q + (-0.051551)*sailStates.r + (0.000128)*sailStates.de;

	Cl = (1.336331)*sailStates.alpha + (0.122669)*sailStates.beta + (-1.879631)*sailStates.p + (16.617956)*sailStates.q + (-0.854796)*sailStates.r + (0.001492)*sailStates.de;
	Cm = (-12.801834)*sailStates.alpha + (-0.000000)*sailStates.beta + (11.115615)*sailStates.p + (-159.507309)*sailStates.q + (3.983586)*sailStates.r + (-0.070987)*sailStates.de;
	Cn = (0.466923)*sailStates.alpha + (0.021630)*sailStates.beta + (0.344945)*sailStates.p + (-0.764123)*sailStates.q + (-0.031460)*sailStates.r + (-0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end