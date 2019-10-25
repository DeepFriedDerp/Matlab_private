function [aeroForces] = paramSpace_4_3_3_1_1_3_3(sailStates,airStates)

	CL = (7.566692)*sailStates.alpha + (-0.282661)*sailStates.beta + (-3.452752)*sailStates.p + (50.777630)*sailStates.q + (4.012460)*sailStates.r + (0.012617)*sailStates.de;
	CD = -3.121930;
	CY = (0.252624)*sailStates.alpha + (-0.022421)*sailStates.beta + (1.630754)*sailStates.p + (-2.326713)*sailStates.q + (-0.324460)*sailStates.r + (-0.000500)*sailStates.de;

	Cl = (3.220094)*sailStates.alpha + (-0.812804)*sailStates.beta + (-1.869850)*sailStates.p + (18.627426)*sailStates.q + (3.405313)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-11.982617)*sailStates.alpha + (1.055930)*sailStates.beta + (8.875496)*sailStates.p + (-156.352325)*sailStates.q + (-13.261356)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (-1.905887)*sailStates.alpha + (0.139165)*sailStates.beta + (-3.309247)*sailStates.p + (15.215048)*sailStates.q + (0.054937)*sailStates.r + (0.000977)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end