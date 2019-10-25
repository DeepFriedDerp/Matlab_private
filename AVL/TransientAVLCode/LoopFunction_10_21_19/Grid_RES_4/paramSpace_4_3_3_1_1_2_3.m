function [aeroForces] = paramSpace_4_3_3_1_1_2_3(sailStates,airStates)

	CL = (3.916001)*sailStates.alpha + (-0.107854)*sailStates.beta + (-3.282788)*sailStates.p + (42.845528)*sailStates.q + (1.760273)*sailStates.r + (0.011027)*sailStates.de;
	CD = -0.021530;
	CY = (-0.087343)*sailStates.alpha + (-0.022421)*sailStates.beta + (0.598733)*sailStates.p + (-2.326710)*sailStates.q + (-0.119179)*sailStates.r + (-0.000500)*sailStates.de;

	Cl = (1.652168)*sailStates.alpha + (-0.248228)*sailStates.beta + (-1.816075)*sailStates.p + (16.533188)*sailStates.q + (1.316801)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-13.131654)*sailStates.alpha + (0.388281)*sailStates.beta + (10.348042)*sailStates.p + (-156.352325)*sailStates.q + (-5.858365)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (-0.559260)*sailStates.alpha + (0.040021)*sailStates.beta + (-0.961080)*sailStates.p + (4.686596)*sailStates.q + (0.001194)*sailStates.r + (0.000749)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end