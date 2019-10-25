function [aeroForces] = paramSpace_4_1_4_1_1_1_2(sailStates,airStates)

	CL = (4.918466)*sailStates.alpha + (-0.229878)*sailStates.beta + (-2.241235)*sailStates.p + (27.427881)*sailStates.q + (-0.835059)*sailStates.r + (0.008779)*sailStates.de;
	CD = -1.470330;
	CY = (-0.182397)*sailStates.alpha + (-0.030602)*sailStates.beta + (-0.526059)*sailStates.p + (-1.664522)*sailStates.q + (0.104461)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (1.176665)*sailStates.alpha + (0.273570)*sailStates.beta + (-1.116552)*sailStates.p + (8.421163)*sailStates.q + (-1.022222)*sailStates.r + (0.000343)*sailStates.de;
	Cm = (-15.113817)*sailStates.alpha + (0.870265)*sailStates.beta + (8.997649)*sailStates.p + (-131.445847)*sailStates.q + (2.666565)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (-0.286154)*sailStates.alpha + (-0.070723)*sailStates.beta + (1.461039)*sailStates.p + (-6.166938)*sailStates.q + (-0.043009)*sailStates.r + (0.000328)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end