function [aeroForces] = paramSpace_1_1_1_1_1_2_2(sailStates,airStates)

	CL = (11.272820)*sailStates.alpha + (-0.842811)*sailStates.beta + (-2.253336)*sailStates.p + (38.353844)*sailStates.q + (-4.187313)*sailStates.r + (0.011503)*sailStates.de;
	CD = -4.669520;
	CY = (1.085634)*sailStates.alpha + (-0.038109)*sailStates.beta + (-2.048748)*sailStates.p + (5.695589)*sailStates.q + (-0.270126)*sailStates.r + (0.001201)*sailStates.de;

	Cl = (6.114563)*sailStates.alpha + (0.516839)*sailStates.beta + (-0.985531)*sailStates.p + (9.928116)*sailStates.q + (-3.599924)*sailStates.r + (-0.000123)*sailStates.de;
	Cm = (-19.240496)*sailStates.alpha + (3.184438)*sailStates.beta + (5.384112)*sailStates.p + (-122.813744)*sailStates.q + (13.988399)*sailStates.r + (-0.066925)*sailStates.de;
	Cn = (-1.983580)*sailStates.alpha + (0.127616)*sailStates.beta + (4.333356)*sailStates.p + (-23.397436)*sailStates.q + (0.114062)*sailStates.r + (-0.001919)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end