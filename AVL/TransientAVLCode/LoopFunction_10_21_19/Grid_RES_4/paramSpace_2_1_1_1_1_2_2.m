function [aeroForces] = paramSpace_2_1_1_1_1_2_2(sailStates,airStates)

	CL = (4.042774)*sailStates.alpha + (-0.039863)*sailStates.beta + (-2.563804)*sailStates.p + (34.634056)*sailStates.q + (0.098317)*sailStates.r + (0.010831)*sailStates.de;
	CD = 0.002540;
	CY = (-0.206975)*sailStates.alpha + (-0.022443)*sailStates.beta + (0.176446)*sailStates.p + (-1.693497)*sailStates.q + (0.011744)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (1.363846)*sailStates.alpha + (-0.013974)*sailStates.beta + (-1.258116)*sailStates.p + (10.287948)*sailStates.q + (0.095451)*sailStates.r + (0.000506)*sailStates.de;
	Cm = (-14.622733)*sailStates.alpha + (0.246036)*sailStates.beta + (8.879431)*sailStates.p + (-136.946671)*sailStates.q + (-0.279189)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (0.322889)*sailStates.alpha + (-0.004994)*sailStates.beta + (-0.431456)*sailStates.p + (3.594517)*sailStates.q + (-0.017154)*sailStates.r + (0.000533)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end