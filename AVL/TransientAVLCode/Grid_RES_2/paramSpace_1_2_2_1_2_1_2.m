function [aeroForces] = paramSpace_1_2_2_1_2_1_2(sailStates,airStates)

	CL = (8.287403)*sailStates.alpha + (-0.619157)*sailStates.beta + (-2.579154)*sailStates.p + (28.929134)*sailStates.q + (0.536811)*sailStates.r + (0.008640)*sailStates.de;
	CD = -5.815830;
	CY = (1.993679)*sailStates.alpha + (-0.003839)*sailStates.beta + (-0.149598)*sailStates.p + (16.242804)*sailStates.q + (-0.015093)*sailStates.r + (0.003460)*sailStates.de;

	Cl = (-2.666966)*sailStates.alpha + (-0.607301)*sailStates.beta + (-1.389363)*sailStates.p + (11.371124)*sailStates.q + (1.223601)*sailStates.r + (0.000361)*sailStates.de;
	Cm = (-11.755783)*sailStates.alpha + (2.969419)*sailStates.beta + (9.441740)*sailStates.p + (-138.545837)*sailStates.q + (-2.086102)*sailStates.r + (-0.068449)*sailStates.de;
	Cn = (-2.156659)*sailStates.alpha + (-0.084831)*sailStates.beta + (-0.290795)*sailStates.p + (-10.458078)*sailStates.q + (0.137414)*sailStates.r + (-0.004596)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end