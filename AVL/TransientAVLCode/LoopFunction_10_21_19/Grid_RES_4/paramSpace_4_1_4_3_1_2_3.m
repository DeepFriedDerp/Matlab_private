function [aeroForces] = paramSpace_4_1_4_3_1_2_3(sailStates,airStates)

	CL = (3.786636)*sailStates.alpha + (0.266163)*sailStates.beta + (-2.696375)*sailStates.p + (37.303776)*sailStates.q + (1.218162)*sailStates.r + (0.010465)*sailStates.de;
	CD = 0.077790;
	CY = (-0.048907)*sailStates.alpha + (-0.027177)*sailStates.beta + (0.350360)*sailStates.p + (-0.684401)*sailStates.q + (-0.069764)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.398106)*sailStates.alpha + (-0.062250)*sailStates.beta + (-1.397640)*sailStates.p + (12.435861)*sailStates.q + (0.902346)*sailStates.r + (0.000753)*sailStates.de;
	Cm = (-13.122610)*sailStates.alpha + (-1.037637)*sailStates.beta + (8.736054)*sailStates.p + (-140.146637)*sailStates.q + (-4.105070)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (-0.204201)*sailStates.alpha + (0.027559)*sailStates.beta + (-0.517144)*sailStates.p + (1.739167)*sailStates.q + (-0.021484)*sailStates.r + (0.000220)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end